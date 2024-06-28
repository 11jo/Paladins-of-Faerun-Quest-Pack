/*
Copyright (c) 2015 Argent77

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
#include <memory>
#include <cstring>
#include <cstdio>
#include <algorithm>
#include "Funcs.hpp"
#include "Colors.hpp"
#include "Compression.hpp"
#include "TileThreadPool.hpp"
#include "Compression.hpp"
#include "Graphics.hpp"

namespace tc {

const char Graphics::HEADER_TIS_SIGNATURE[4]    = {'T', 'I', 'S', ' '};
const char Graphics::HEADER_MOS_SIGNATURE[4]    = {'M', 'O', 'S', ' '};
const char Graphics::HEADER_MOSC_SIGNATURE[4]   = {'M', 'O', 'S', 'C'};

const char Graphics::HEADER_VERSION_V1[4]       = {'V', '1', ' ', ' '};
const char Graphics::HEADER_VERSION_V2[4]       = {'V', '2', ' ', ' '};

const unsigned Graphics::MAX_PROGRESS           = 69;
const unsigned Graphics::MAX_POOL_TILES         = 64;

const BinPack2D::HeuristicRules Graphics::BIN_RULE  = BinPack2D::HeuristicRules::BottomLeftRule;


Graphics::Graphics(Options &options) noexcept
: m_options(options)
{
}


Graphics::~Graphics() noexcept
{
}


bool Graphics::tisV1ToTisV2(const std::string &inFile, const std::string &outFile) noexcept
{
  if (!inFile.empty() && !outFile.empty() && inFile != outFile) {
    File fin(inFile.c_str(), "rb");
    if (fin.error()) {
      std::printf("Error opening file \"%s\"\n", inFile.c_str());
      return false;
    }

    // parsing TIS header
    unsigned tileCount;
    if (!readTisHeader(fin, true, tileCount)) {
      return false;
    }

    File fout(outFile.c_str(), "wb");
    fout.setDeleteOnClose(true);
    if (fout.error()) {
      std::printf("Error creating file \"%s\"\n", outFile.c_str());
      return false;
    }

    uint32_t v32;

    // writing TIS V2 header
    if (fout.write(HEADER_TIS_SIGNATURE, 1, sizeof(HEADER_TIS_SIGNATURE)) != sizeof(HEADER_TIS_SIGNATURE)) {
      return false;
    }
    if (fout.write(HEADER_VERSION_V1, 1, sizeof(HEADER_VERSION_V1)) != sizeof(HEADER_VERSION_V1)) {
      return false;
    }
    v32 = tileCount; v32 = get32u_le(&v32);
    if (fout.write(&v32, 4, 1) != 1) { return false; }
    v32 = 0x0c; v32 = get32u_le(&v32);  // TIS V2 tile size
    if (fout.write(&v32, 4, 1) != 1) { return false; }
    v32 = 0x18; v32 = get32u_le(&v32);  // start of tile data
    if (fout.write(&v32, 4, 1) != 1) { return false; }
    v32 = 0x40; v32 = get32u_le(&v32);  // tile dimension
    if (fout.write(&v32, 4, 1) != 1) { return false; }

    // converting tiles
    int tileX = 0, tileY = 0, tilePage = 0;
    int baseTilePage = getOptions().getTisPage();
    std::vector<BinPack2D> binpacks;
    std::vector<Texture> textures;
    BytePtr ptrPalette(new uint8_t[PALETTE_SIZE], std::default_delete<uint8_t[]>());
    BytePtr ptrIndexed(new uint8_t[MAX_TILE_SIZE_8], std::default_delete<uint8_t[]>());
    BytePtr ptrPixels(new uint8_t[MAX_TILE_SIZE_32], std::default_delete<uint8_t[]>());
    for (unsigned tileIdx = 0; tileIdx < tileCount; tileIdx++) {
      if (fin.read(ptrPalette.get(), 1, PALETTE_SIZE) != PALETTE_SIZE) { return false; }
      if (fin.read(ptrIndexed.get(), 1, MAX_TILE_SIZE_8) != MAX_TILE_SIZE_8) { return false; }

      bool isTileEmpty = paletteToPixels(ptrPalette, ptrIndexed, ptrPixels, TILE_DIMENSION, TILE_DIMENSION);

      // finding position on texture
      if (isTileEmpty) {
        tileX = tileY = 0;
        tilePage = -1;    // indicates black tile
      } else {
        size_t startIndex = 0;
        tileX = tileY = tilePage = -1;
        while (tilePage < 0) {
          for (size_t i = startIndex; i < binpacks.size(); i++) {
            BinPack2D &bin = binpacks.at(i);
            Rect r = bin.insert(TILE_DIMENSION, TILE_DIMENSION, BIN_RULE);
            if (r.width > 0) {
              tileX = r.x;
              tileY = r.y;
              tilePage = i;
              textures.at(tilePage).setDataBlock(tileX, tileY, TILE_DIMENSION, TILE_DIMENSION, ptrPixels);
              break;
            }
          }
          if (tilePage < 0) {
            if (baseTilePage + textures.size() > 99) {
              std::printf("PVRZ page index is out of range: %d\n", (int)(baseTilePage + textures.size()));
              return false;
            }
            binpacks.emplace_back(BinPack2D(1024, 1024));
            textures.emplace_back(Texture(getOptions(), 1024, 1024));
            Texture &texture = textures.at(textures.size() - 1);
            texture.setIndex(baseTilePage + textures.size() - 1);
            texture.setEncoding(Encoding::BC1);
            startIndex = binpacks.size() - 1;
          }
        }
      }

      // writing tile info to output TIS
      v32 = baseTilePage + tilePage; v32 = get32u_le(&v32);
      if (fout.write(&v32, 4, 1) != 1) { return false; }
      v32 = tileX; v32 = get32u_le(&v32);
      if (fout.write(&v32, 4, 1) != 1) { return false; }
      v32 = tileY; v32 = get32u_le(&v32);
      if (fout.write(&v32, 4, 1) != 1) { return false; }
    }

    // writing textures as PVRZ files to disk
    ThreadPoolPtr pool = createThreadPool(getOptions().getThreads(), MAX_POOL_TILES);
    unsigned textureIdx = 0, nextTileIdx = 0, curProgress = 0;
    while (textureIdx < textures.size() || !pool->finished()) {
      if (textureIdx < textures.size()) {
        Texture &texture = textures.at(textureIdx);
        BinPack2D &bin = binpacks.at(textureIdx);
        bin.shrinkBin(true);
        texture.resizeTexture(bin.getBinWidth(), bin.getBinHeight());

        size_t encodedSize = Texture::CalculateDataBlockSize(texture.getWidth(), texture.getHeight(),
                                                             Encoding::BC1);
        BytePtr ptrEncoded(new uint8_t[encodedSize], std::default_delete<uint8_t[]>());

        TileDataPtr tileData(new TileData(getOptions()));
        tileData->setEncoding(Encoding::BC1);
        tileData->setIndex(texture.getIndex());
        tileData->setInputType(FileType::TISV1);
        tileData->setInputData(texture.getData());
        tileData->setOutputData(ptrEncoded);
        tileData->setWidth(texture.getWidth());
        tileData->setHeight(texture.getHeight());
        pool->addTileData(tileData);
        textureIdx++;
      }

      while (pool->hasResult() && pool->peekResult() != nullptr) {
        TileDataPtr retVal = pool->getResult();
        if (retVal == nullptr || retVal->isError()) {
          if (retVal != nullptr && !retVal->getErrorMsg().empty()) {
            std::printf("\n%s", retVal->getErrorMsg().c_str());
          }
          return false;
        }

        std::string pvrzFileName =
            File::CreateFileName(getOptions().getOutPath(),
                                 Options::GenerateTisPvrzName(File::ExtractFileName(outFile),
                                                              retVal->getIndex()));
        File texOut(pvrzFileName.c_str(), "wb");
        if (!writePvrz(texOut, retVal->getOutputData(), retVal->getWidth(), retVal->getHeight(),
                      retVal->getEncoding())) {
          return false;
        }

        if (!getOptions().isSilent()) {
          curProgress = showProgress(nextTileIdx, textures.size(), curProgress, MAX_PROGRESS, '.');
        }
        nextTileIdx++;
      }
      if (textureIdx >= textures.size()) {
        pool->waitForResult();
      }
    }

    if (!getOptions().isSilent()) {
      std::printf("\n");
    }

    // display summary
    if (!getOptions().isSilent()) {
      std::printf("TIS V1 file converted successfully. Total number of PVRZ files: %u\n",
                  (unsigned)textures.size());
    }

    fout.setDeleteOnClose(false);
    return true;
  }
  return false;
}


bool Graphics::tisV2ToTisV1(const std::string &inFile, const std::string &outFile) noexcept
{
  if (!inFile.empty() && !outFile.empty() && inFile != outFile) {
    File fin(inFile.c_str(), "rb");
    if (fin.error()) {
      std::printf("Error opening file \"%s\"\n", inFile.c_str());
      return false;
    }

    // parsing TIS header
    unsigned tileCount;
    if (!readTisHeader(fin, false, tileCount)) {
      return false;
    }

    File fout(outFile.c_str(), "wb");
    fout.setDeleteOnClose(true);
    if (fout.error()) {
      std::printf("Error creating file \"%s\"\n", outFile.c_str());
      return false;
    }

    uint32_t v32;

    // writing TIS V1 header
    if (fout.write(HEADER_TIS_SIGNATURE, 1, sizeof(HEADER_TIS_SIGNATURE)) != sizeof(HEADER_TIS_SIGNATURE)) {
      return false;
    }
    if (fout.write(HEADER_VERSION_V1, 1, sizeof(HEADER_VERSION_V1)) != sizeof(HEADER_VERSION_V1)) {
      return false;
    }
    v32 = tileCount; v32 = get32u_le(&v32);
    if (fout.write(&v32, 4, 1) != 1) { return false; }
    v32 = 0x1400; v32 = get32u_le(&v32);  // TIS V1 tile size
    if (fout.write(&v32, 4, 1) != 1) { return false; }
    v32 = 0x18; v32 = get32u_le(&v32);    // start of tile data
    if (fout.write(&v32, 4, 1) != 1) { return false; }
    v32 = 0x40; v32 = get32u_le(&v32);    // tile dimension
    if (fout.write(&v32, 4, 1) != 1) { return false; }

    // converting tiles
    Texture texture(getOptions(), 4, 4); texture.setIndex(-1);
    Texture blackTile(getOptions(), TILE_DIMENSION, TILE_DIMENSION);
    ThreadPoolPtr pool = createThreadPool(getOptions().getThreads(), MAX_POOL_TILES);
    unsigned tileIdx = 0, nextTileIdx = 0, curProgress = 0;
    while (tileIdx < tileCount || !pool->finished()) {
      // creating new tile object
      if (tileIdx < tileCount) {
        // reading tile data
        int32_t page, tileX, tileY;
        if (fin.read(&page, 4, 1) != 1) { return false; }  // page
        page = get32s_le(&page);
        if (fin.read(&tileX, 4, 1) != 1) { return false; }  // x
        tileX = get32s_le(&tileX);
        if (fin.read(&tileY, 4, 1) != 1) { return false; }  // y
        tileY = get32s_le(&tileY);

        BytePtr ptrPixels(new uint8_t[MAX_TILE_SIZE_32], std::default_delete<uint8_t[]>());
        BytePtr ptrPalette(new uint8_t[PALETTE_SIZE], std::default_delete<uint8_t[]>());
        BytePtr ptrIndexed(new uint8_t[MAX_TILE_SIZE_8], std::default_delete<uint8_t[]>());

        TileDataPtr tileData(new TileData(getOptions()));
        tileData->setIndex(tileIdx);
        tileData->setInputType(FileType::TISV2);
        tileData->setWidth(TILE_DIMENSION);
        tileData->setHeight(TILE_DIMENSION);

        if (page < 0) {
          // using black block of pixels
          size_t blockSize = Texture::CalculateDataBlockSize(blackTile.getWidth(),
                                                             blackTile.getHeight());
          std::memcpy(ptrPixels.get(), blackTile.getData().get(), blockSize);
          tileData->setEncoding(Encoding::BC1);
        } else {
          if (texture.getIndex() != page) {
            std::string pvrzFileName = Options::GenerateTisPvrzName(File::ExtractFileName(inFile), page);
            std::string pvrzFilePath = getOptions().searchFile(pvrzFileName, File::ExtractFilePath(inFile));
            if (!File::Exists(pvrzFilePath) || File::IsDirectory(pvrzFilePath)) {
              return false;
            }
            File fin(pvrzFilePath.c_str(), "rb");
            if (!texture.loadPvrz(fin)) {
              return false;
            }
            texture.setIndex(page);
            texture.setEncoding(Encoding::BC1);
          }

          // fetching texture data
          texture.getDataBlock(tileX, tileY, TILE_DIMENSION, TILE_DIMENSION, ptrPixels);
          tileData->setEncoding(Encoding::BC1);
        }

        tileData->setInputData(ptrPixels);
        tileData->setPaletteData(ptrPalette);
        tileData->setOutputData(ptrIndexed);
        pool->addTileData(tileData);
        tileIdx++;
      }

      // processing converted tiles
      while (pool->hasResult() && pool->peekResult() != nullptr &&
             (unsigned)pool->peekResult()->getIndex() == nextTileIdx) {
        TileDataPtr retVal = pool->getResult();
        if (retVal == nullptr || retVal->isError()) {
          if (retVal != nullptr && !retVal->getErrorMsg().empty()) {
            std::printf("\n%s", retVal->getErrorMsg().c_str());
          }
          return false;
        }

        if (!writeTisV1Tile(retVal, fout)) {
          return false;
        }
        if (!getOptions().isSilent()) {
          curProgress = showProgress(nextTileIdx, tileCount, curProgress, MAX_PROGRESS, '.');
        }
        nextTileIdx++;
      }
      if (tileIdx >= tileCount) {
        pool->waitForResult();
      }
    }

    if (!getOptions().isSilent()) {
      std::printf("\n");
    }

    if (nextTileIdx < tileCount) {
      std::printf("Missing tiles. Only %d out of %d tiles converted.\n", nextTileIdx, tileCount);
      return false;
    }

    // display summary
    if (!getOptions().isSilent()) {
      std::printf("TIS V2 file converted successfully.\n");
    }

    fout.setDeleteOnClose(false);
    return true;
  }
  return false;
}


bool Graphics::mosV1ToMosV2(const std::string &inFile, const std::string &outFile,
                            int pvrzIndexFirst, int &pvrzIndexLast) noexcept
{
  if (!inFile.empty() && !outFile.empty() && inFile != outFile) {
    File fin(inFile.c_str(), "rb");
    if (fin.error()) {
      std::printf("Error opening file \"%s\"\n", inFile.c_str());
      return false;
    }

    // parsing input MOS data
    unsigned mosWidth, mosHeight, ofsPalette;
    BytePtr ptrMos = readMosV1(fin, mosWidth, mosHeight, ofsPalette);
    if (ptrMos == nullptr) {
      return false;
    }
    unsigned numCols = (mosWidth + 63) >> 6;
    unsigned numRows = (mosHeight + 63) >> 6;
    unsigned numBlocks = numCols*numRows;
    unsigned lastColWidth = (mosWidth & 63) ? mosWidth & 63 : TILE_DIMENSION;
    unsigned lastRowHeight = (mosHeight & 63) ? mosHeight & 63 : TILE_DIMENSION;

    File fout(outFile.c_str(), "wb");
    fout.setDeleteOnClose(true);
    if (fout.error()) {
      std::printf("Error creating file \"%s\"\n", outFile.c_str());
      return false;
    }

    uint32_t v32;

    // writing MOS V2 header
    if (fout.write(HEADER_MOS_SIGNATURE, 1, sizeof(HEADER_MOS_SIGNATURE)) != sizeof(HEADER_MOS_SIGNATURE)) {
      return false;
    }
    if (fout.write(HEADER_VERSION_V2, 1, sizeof(HEADER_VERSION_V2)) != sizeof(HEADER_VERSION_V2)) {
      return false;
    }
    v32 = mosWidth; v32 = get32u_le(&v32);    // MOS width
    if (fout.write(&v32, 4, 1) != 1) { return false; }
    v32 = mosHeight; v32 = get32u_le(&v32);   // MOS height
    if (fout.write(&v32, 4, 1) != 1) { return false; }
    v32 = numBlocks; v32 = get32u_le(&v32);   // number of data blocks
    if (fout.write(&v32, 4, 1) != 1) { return false; }
    v32 = 0x18; v32 = get32u_le(&v32);        // start offset of data blocks
    if (fout.write(&v32, 4, 1) != 1) { return false; }

    // converting tiles
    int tileX = 0, tileY = 0, tilePage = 0;
    std::vector<BinPack2D> binpacks;
    std::vector<Texture> textures;
    BytePtr ptrPalette(new uint8_t[PALETTE_SIZE], std::default_delete<uint8_t[]>());
    BytePtr ptrIndexed(new uint8_t[MAX_TILE_SIZE_8], std::default_delete<uint8_t[]>());
    BytePtr ptrPixels(new uint8_t[MAX_TILE_SIZE_32], std::default_delete<uint8_t[]>());
    size_t ofsTileOfs = ofsPalette + numBlocks*PALETTE_SIZE;
    size_t ofsTileData = ofsTileOfs + numBlocks*4;
    int finalPvrzPage = -1; // caches highest pvrz texture index
    for (unsigned y = 0, blockIdx = 0; y < numRows; y++) {
      unsigned blockHeight = (y == numRows-1) ? lastRowHeight : TILE_DIMENSION;
      for (unsigned x = 0; x < numCols; x++, blockIdx++) {
        unsigned blockWidth = (x == numCols-1) ? lastColWidth : TILE_DIMENSION;
        unsigned blockSize = blockWidth*blockHeight;

        std::memcpy(ptrPalette.get(), ptrMos.get() + ofsPalette + blockIdx*PALETTE_SIZE, PALETTE_SIZE);
        v32 = get32u_le((uint32_t*)(ptrMos.get() + ofsTileOfs + blockIdx*4));
        std::memcpy(ptrIndexed.get(), ptrMos.get() + ofsTileData + v32, blockSize);

        paletteToPixels(ptrPalette, ptrIndexed, ptrPixels, blockWidth, blockHeight);

        // finding position on texture
        size_t startIdx = 0;
        tileX = tileY = tilePage = -1;
        while (tilePage < 0) {
          for (size_t i = startIdx; i < binpacks.size(); i++) {
            BinPack2D &bin = binpacks.at(i);
            Rect r = bin.insert(TILE_DIMENSION, TILE_DIMENSION, BIN_RULE);
            if (r.width > 0) {
              tileX = r.x;
              tileY = r.y;
              tilePage = textures.at(i).getIndex();
              textures.at(i).setDataBlock(tileX, tileY, blockWidth, blockHeight, ptrPixels);
              break;
            }
          }
          if (tilePage < 0) {
            binpacks.emplace_back(BinPack2D(1024, 1024));
            textures.emplace_back(Texture(getOptions(), 1024, 1024));
            Texture &texture = textures.at(textures.size() - 1);
            // don't overwrite existing pvrz files (unless forced)
            finalPvrzPage = findFreePvrzIndex(outFile, finalPvrzPage + 1);
            texture.setIndex(finalPvrzPage);
            texture.setEncoding(Encoding::BC1);
            startIdx = binpacks.size() - 1;
          }
        }

        // writing tile info to output MOS
        v32 = getOptions().getMosIndex() + tilePage; v32 = get32u_le(&v32);
        if (fout.write(&v32, 4, 1) != 1) { return false; }  // PVRZ page
        v32 = tileX; v32 = get32u_le(&v32);
        if (fout.write(&v32, 4, 1) != 1) { return false; }  // Source X (PVRZ)
        v32 = tileY; v32 = get32u_le(&v32);
        if (fout.write(&v32, 4, 1) != 1) { return false; }  // Source Y (PVRZ)
        v32 = blockWidth; v32 = get32u_le(&v32);
        if (fout.write(&v32, 4, 1) != 1) { return false; }  // Width
        v32 = blockHeight; v32 = get32u_le(&v32);
        if (fout.write(&v32, 4, 1) != 1) { return false; }  // Height
        v32 = x*TILE_DIMENSION; v32 = get32u_le(&v32);
        if (fout.write(&v32, 4, 1) != 1) { return false; }  // Target X (MOS)
        v32 = y*TILE_DIMENSION; v32 = get32u_le(&v32);
        if (fout.write(&v32, 4, 1) != 1) { return false; }  // Target Y (MOS)

      }
    }

    // writing textures as PVRZ files to disk
    ThreadPoolPtr pool = createThreadPool(getOptions().getThreads(), MAX_POOL_TILES);
    unsigned textureIdx = 0, nextTileIdx = 0, curProgress = 0;
    while (textureIdx < textures.size() || !pool->finished()) {
      if (textureIdx < textures.size()) {
        Texture &texture = textures.at(textureIdx);
        BinPack2D &bin = binpacks.at(textureIdx);
        bin.shrinkBin(true);
        texture.resizeTexture(bin.getBinWidth(), bin.getBinHeight());

        size_t encodedSize = Texture::CalculateDataBlockSize(texture.getWidth(), texture.getHeight(),
                                                             Encoding::BC1);
        BytePtr ptrEncoded(new uint8_t[encodedSize], std::default_delete<uint8_t[]>());

        TileDataPtr tileData(new TileData(getOptions()));
        tileData->setEncoding(Encoding::BC1);
        tileData->setIndex(textureIdx);
        tileData->setInputType(FileType::MOSV1);
        tileData->setInputData(texture.getData());
        tileData->setOutputData(ptrEncoded);
        tileData->setWidth(texture.getWidth());
        tileData->setHeight(texture.getHeight());
        tileData->setPvrzIndex(texture.getIndex());
        pool->addTileData(tileData);
        textureIdx++;
      }

      while (pool->hasResult() && pool->peekResult() != nullptr) {
        TileDataPtr retVal = pool->getResult();
        if (retVal == nullptr || retVal->isError()) {
          if (retVal != nullptr && !retVal->getErrorMsg().empty()) {
            std::printf("\n%s", retVal->getErrorMsg().c_str());
          }
          return false;
        }

        std::string pvrzFileName(Options::GenerateMosPvrzName(outFile, getOptions().getMosIndex() + retVal->getPvrzIndex()));

        File texOut(pvrzFileName.c_str(), "wb");
        if (!writePvrz(texOut, retVal->getOutputData(), retVal->getWidth(), retVal->getHeight(),
                      retVal->getEncoding())) {
          return false;
        }

        if (!getOptions().isSilent()) {
          curProgress = showProgress(nextTileIdx, textures.size(), curProgress, MAX_PROGRESS, '.');
        }
        nextTileIdx++;
      }
      if (textureIdx >= textures.size()) {
        pool->waitForResult();
      }
    }

    if (!getOptions().isSilent()) {
      std::printf("\n");
    }

    // display summary
    if (!getOptions().isSilent()) {
      std::printf("MOS V1 file converted successfully. Total number of PVRZ files: %u\n",
                  (unsigned)textures.size());
    }

    fout.setDeleteOnClose(false);
    return true;
  }
  return false;
}


bool Graphics::mosV2ToMosV1(const std::string &inFile, const std::string &outFile) noexcept
{
  if (!inFile.empty() && !outFile.empty() && inFile != outFile) {
    File fin(inFile.c_str(), "rb");
    if (fin.error()) {
      std::printf("Error opening file \"%s\"\n", inFile.c_str());
      return false;
    }

    // parsing MOS input
    char id[4];
    uint16_t v16;
    uint32_t v32;
    if (fin.read(id, 1, 4) != 4) { return false; }
    if (std::strncmp(id, HEADER_MOS_SIGNATURE, 4) != 0) { return false; }
    if (fin.read(id, 1, 4) != 4) { return false; }
    if (std::strncmp(id, HEADER_VERSION_V2, 4) != 0) { return false; }
    if (fin.read(&v32, 4, 1) != 1) { return false; }
    unsigned mosWidth = get32u_le(&v32); if (mosWidth == 0) { return false; }
    if (fin.read(&v32, 4, 1) != 1) { return false; }
    unsigned mosHeight = get32u_le(&v32); if (mosHeight == 0) { return false; }
    if (fin.read(&v32, 4, 1) != 1) { return false; }
    unsigned numBlocks = get32u_le(&v32); if (numBlocks == 0) { return false; }
    if (fin.read(&v32, 4, 1) != 1) { return false; }
    unsigned ofsBlocks = get32u_le(&v32); if (ofsBlocks < 0x18) { return false; }

    // creating MOS output image
    unsigned headerSize = 0x18;
    unsigned numCols = (mosWidth + 63) >> 6;
    unsigned numRows = (mosHeight + 63) >> 6;
    unsigned numTiles = numCols*numRows;
    unsigned lastColWidth = (mosWidth & 63) ? (mosWidth & 63) : TILE_DIMENSION;
    unsigned lastRowHeight = (mosHeight & 63) ? (mosHeight & 63) : TILE_DIMENSION;
    unsigned ofsPalette = headerSize;
    unsigned ofsTileOffsets = ofsPalette + numTiles*PALETTE_SIZE;
    unsigned ofsTileData = ofsTileOffsets + numTiles*4;
    unsigned mosSize = ofsTileData + (numRows-1)*(numCols-1)*MAX_TILE_SIZE_8 +
                                     (numRows-1)*TILE_DIMENSION*lastColWidth +
                                     lastRowHeight*(numCols-1)*TILE_DIMENSION +
                                     lastRowHeight*lastColWidth;
    BytePtr ptrMos(new uint8_t[mosSize], std::default_delete<uint8_t[]>());

    // initializing header and tile offsets in MOS output image
    std::memcpy(ptrMos.get(), HEADER_MOS_SIGNATURE, 4);
    std::memcpy(ptrMos.get() + 4, HEADER_VERSION_V1, 4);
    v16 = mosWidth; v16 = get16u_le(&v16);
    std::memcpy(ptrMos.get() + 8, &v16, 2);
    v16 = mosHeight; v16 = get16u_le(&v16);
    std::memcpy(ptrMos.get() + 10, &v16, 2);
    v16 = numCols; v16 = get16u_le(&v16);
    std::memcpy(ptrMos.get() + 12, &v16, 2);
    v16 = numRows; v16 = get16u_le(&v16);
    std::memcpy(ptrMos.get() + 14, &v16, 2);
    v32 = TILE_DIMENSION; v32 = get32u_le(&v32);
    std::memcpy(ptrMos.get() + 16, &v32, 4);
    v32 = 0x18; v32 = get32u_le(&v32);
    std::memcpy(ptrMos.get() + 20, &v32, 4);
    for (unsigned y = 0, curTileOfs = 0, curOfs = ofsTileOffsets; y < numRows; y++) {
      unsigned rowHeight = (y == numRows-1) ? lastRowHeight : TILE_DIMENSION;
      for (unsigned x = 0; x < numCols; x++) {
        unsigned colWidth = (x == numCols-1) ? lastColWidth: TILE_DIMENSION;
        v32 = curTileOfs; v32 = get32u_le(&v32);
        std::memcpy(ptrMos.get() + curOfs, &v32, 4);
        curOfs += 4;
        curTileOfs += rowHeight*colWidth;
      }
    }

    // converting data blocks
    Texture mosTexture(getOptions(), mosWidth, mosHeight);
    Texture texture(getOptions(), 4, 4); texture.setIndex(-1);
    for (unsigned blockIdx = 0; blockIdx < numBlocks; blockIdx++) {
      // creating new tile object

      // reading tile data
      uint32_t page, srcX, srcY, width, height, dstX, dstY;
      if (fin.read(&page, 4, 1) != 1) { return false; }   // page
      page = get32u_le(&page);
      if (fin.read(&srcX, 4, 1) != 1) { return false; }   // source x (PVRZ)
      srcX = get32u_le(&srcX);
      if (fin.read(&srcY, 4, 1) != 1) { return false; }   // source y (PVRZ)
      srcY = get32u_le(&srcY);
      if (fin.read(&width, 4, 1) != 1) { return false; }  // block width
      width = get32u_le(&width);
      if (fin.read(&height, 4, 1) != 1) { return false; } // block height
      height = get32u_le(&height);
      if (fin.read(&dstX, 4, 1) != 1) { return false; }   // target x (MOS)
      dstX = get32u_le(&dstX);
      if (fin.read(&dstY, 4, 1) != 1) { return false; }   // target y (MOS)
      dstY = get32u_le(&dstY);

      if ((unsigned)texture.getIndex() != page) {
        std::string pvrzFileName = Options::GenerateMosPvrzName(File::ExtractFileName(inFile), page);
        std::string pvrzFilePath = getOptions().searchFile(pvrzFileName, File::ExtractFilePath(inFile));
        if (!File::Exists(pvrzFilePath) || File::IsDirectory(pvrzFilePath)) {
          return false;
        }
        File pvrzIn(pvrzFilePath.c_str(), "rb");
        if (!texture.loadPvrz(pvrzIn)) {
          return false;
        }
        texture.setIndex(page);
        texture.setEncoding(Encoding::BC1);
      }

      // fetching texture data
      BytePtr ptrBlock(new uint8_t[width*height*4], std::default_delete<uint8_t[]>());
      texture.getDataBlock(srcX, srcY, width, height, ptrBlock);
      mosTexture.setDataBlock(dstX, dstY, width, height, ptrBlock);
    }

    // converting image data to MOS V1
    ThreadPoolPtr pool = createThreadPool(getOptions().getThreads(), MAX_POOL_TILES);
    unsigned tileIdx = 0, nextTileIdx = 0, curProgress = 0;
    while (tileIdx < numTiles || !pool->finished()) {
      unsigned y = tileIdx / numCols;
      unsigned x = tileIdx % numCols;
      unsigned rowHeight = (y == numRows-1) ? lastRowHeight : TILE_DIMENSION;
      unsigned colWidth = (x == numCols-1) ? lastColWidth: TILE_DIMENSION;

      // creating new tile object
      if (tileIdx < numTiles) {
        BytePtr ptrPixels(new uint8_t[MAX_TILE_SIZE_32], std::default_delete<uint8_t[]>());
        mosTexture.getDataBlock(x*TILE_DIMENSION, y*TILE_DIMENSION, colWidth, rowHeight, ptrPixels);
        BytePtr ptrPalette(new uint8_t[PALETTE_SIZE], std::default_delete<uint8_t[]>());
        BytePtr ptrIndexed(new uint8_t[MAX_TILE_SIZE_8], std::default_delete<uint8_t[]>());

        TileDataPtr tileData(new TileData(getOptions()));
        tileData->setIndex(tileIdx);
        tileData->setInputType(FileType::MOSV2);
        tileData->setWidth(colWidth);
        tileData->setHeight(rowHeight);
        tileData->setEncoding(Encoding::BC1);
        tileData->setInputData(ptrPixels);
        tileData->setPaletteData(ptrPalette);
        tileData->setOutputData(ptrIndexed);
        pool->addTileData(tileData);
        tileIdx++;
      }

      // processing converted tiles
      while (pool->hasResult() && pool->peekResult() != nullptr &&
             (unsigned)pool->peekResult()->getIndex() == nextTileIdx) {
        TileDataPtr retVal = pool->getResult();
        if (retVal == nullptr || retVal->isError()) {
          if (retVal != nullptr && !retVal->getErrorMsg().empty()) {
            std::printf("\n%s", retVal->getErrorMsg().c_str());
          }
          return false;
        }
        int curTileIdx = retVal->getIndex();

        // writing palette
        std::memcpy(ptrMos.get() + ofsPalette + curTileIdx*PALETTE_SIZE,
                    retVal->getPaletteData().get(), PALETTE_SIZE);

        // writing tile data
        std::memcpy(&v32, ptrMos.get() + ofsTileOffsets + curTileIdx*4, 4);
        unsigned curOfsTile = get32u_le(&v32) + ofsTileData;
        unsigned curTileSize = retVal->getWidth()*retVal->getHeight();
        std::memcpy(ptrMos.get() + curOfsTile, retVal->getOutputData().get(), curTileSize);

        if (!getOptions().isSilent()) {
          curProgress = showProgress(nextTileIdx, numTiles, curProgress, MAX_PROGRESS, '.');
        }
        nextTileIdx++;
      }
      if (tileIdx >= numTiles) {
        pool->waitForResult();
      }
    }

    // writing MOS image to disk
    File fout(outFile.c_str(), "wb");
    fout.setDeleteOnClose(true);
    if (fout.error()) {
      std::printf("Error creating file \"%s\"\n", outFile.c_str());
      return false;
    }
    if (!writeMosV1(fout, ptrMos, mosSize)) {
      return false;
    }

    if (!getOptions().isSilent()) {
      std::printf("\n");
    }

    // display summary
    if (!getOptions().isSilent()) {
      std::printf("MOS V2 file converted successfully.\n");
    }

    fout.setDeleteOnClose(false);
    return true;
  }
  return false;
}

bool Graphics::paletteToPixels(BytePtr pal, BytePtr indexed, BytePtr pixels, int width, int height) noexcept
{
  if (pal != nullptr && indexed != nullptr && pixels != nullptr &&
      width > 0 && height > 0) {

    // preparing palette
    IntPtr palEntries(new uint32_t[256], std::default_delete<uint32_t[]>());
    uint32_t *srcPal = (uint32_t*)pal.get();
    for (unsigned i = 0; i < 256; i++) {
      uint32_t v32 = get32u_le(srcPal + i) & 0x00ffffff;
      *(palEntries.get() + i) = (v32 == 0x0000ff00) ? 0 : v32 | 0xff000000;
    }

    // converting 8-bit pixels to 32-bit pixels (and checking if tile is pure black)
    uint8_t *src = indexed.get();
    uint32_t *dst = (uint32_t*)pixels.get();
    bool isTileEmpty = true;
    int numPixels = width*height;
    for (int i = 0; i < numPixels; i++, src++, dst++) {
      *dst = *(palEntries.get() + *src);
      isTileEmpty &= ((*dst & 0x00ffffff) == 0);
    }

    return isTileEmpty;
  }
  return false;
}

bool Graphics::readTisHeader(File &fin, bool v1, unsigned &numTiles) noexcept
{
  char id[4];
  bool isHeaderless = false;
  uint32_t v32;

  if (fin.read(id, 1, 4) != 4) return false;
  if (std::strncmp(id, HEADER_TIS_SIGNATURE, 4) != 0) {
    if (getOptions().assumeTis()) {
      isHeaderless = true;
    } else {
      std::printf("Invalid TIS signature\n");
      return false;
    }
  }

  if (!isHeaderless) {
    if (fin.read(id, 1, 4) != 4) return false;
    if (std::strncmp(id, HEADER_VERSION_V2, 4) == 0) {
      if (!getOptions().isSilent()) {
        std::printf("Warning: Incorrect TIS version 2 found. Converting anyway.\n");
      }
    } else if (std::strncmp(id, HEADER_VERSION_V1, 4) != 0) {
      std::printf("Invalid TIS version\n");
      return false;
    }

    if (fin.read(&v32, 4, 1) != 1) return false;
    numTiles = get32u_le(&v32);
    if (numTiles == 0) {
      std::printf("No tiles found\n");
      return false;
    }

    if (fin.read(&v32, 4, 1) != 1) return false;
    v32 = get32u_le(&v32);
    if (v1 && v32 != 0x1400) {
      if (v32 == 0x000c) {
        std::printf("PVRZ-based TIS files are not supported\n");
      } else {
        std::printf("Invalid tile size\n");
      }
      return false;
    } else if (!v1 && v32 != 0x000c) {
      if (v32 == 0x1400) {
        std::printf("Palette-based TIS files are not supported\n");
      } else {
        std::printf("Invalid tile size\n");
      }
      return false;
    }

    if (fin.read(&v32, 4, 1) != 1) return false;
    v32 = get32u_le(&v32);
    if (v32 < 0x18) {
      std::printf("Invalid header size\n");
      return false;
    }

    if (fin.read(&v32, 4, 1) != 1) return false;
    v32 = get32u_le(&v32);
    if (v32 != 0x40) {
      std::printf("Invalid tile dimensions\n");
      return false;
    }
  } else {
    long size = fin.getsize();
    fin.seek(0L, SEEK_SET);
    if (size < 0L) {
      std::printf("Error reading input file\n");
      return false;
    } else if ((size % 0x1400) != 0 && (size % 0x000c) != 0) {
      std::printf("Headerless TIS has wrong file size\n");
      return false;
    } else {
      if (!getOptions().isSilent()) std::printf("Warning: Headerless TIS file detected\n");
      if (v1) {
        if ((size % 0x1400) == 0) {
          numTiles = (unsigned)size / 0x1400;
        } else if ((size % 0x000c) == 0) {
          std::printf("PVRZ-based TIS files are not supported\n");
          return false;
        } else {
          std::printf("Invalid tile size\n");
          return false;
        }
      } else {
        if ((size % 0x000c) == 0) {
          numTiles = (unsigned)size / 0x000c;
        } else if ((size % 0x1400) == 0) {
          std::printf("Palette-based TIS files are not supported\n");
          return false;
        } else {
          std::printf("Invalid tile size\n");
          return false;
        }
      }
    }
  }

  return true;
}

bool Graphics::writeTisV1Tile(TileDataPtr tileData, File &fout) noexcept
{
  if (tileData != nullptr) {
    if (fout.write(tileData->getPaletteData().get(), 1, PALETTE_SIZE) != PALETTE_SIZE) {
      return false;
    }
    size_t size = tileData->getWidth()*tileData->getHeight();
    if (fout.write(tileData->getOutputData().get(), 1, size) != size) {
      return false;
    }
    return true;
  }
  return false;
}

BytePtr Graphics::readMosV1(File &fin, unsigned &width, unsigned &height, unsigned &palOfs) noexcept
{
  BytePtr retVal(nullptr);

  char id[4];
  uint32_t v32, mosSize;

  // loading MOS/MOSC input file
  if (fin.read(id, 1, 4) != 4) { return retVal; }
  if (std::strncmp(id, HEADER_MOSC_SIGNATURE, 4) == 0) {  // decompressing MOSC
    uint32_t moscSize;
    Compression compress;

    // getting MOSC file size
    moscSize = fin.getsize();
    if (moscSize <= 12) {
      std::printf("Invalid MOSC size\n");
      return retVal;
    }
    moscSize -= 12;

    if (fin.read(&id, 1, 4) != 4) { return retVal; }
    if (std::strncmp(id, HEADER_VERSION_V1, 4) != 0) {
      std::printf("Invalid MOSC version\n");
      return retVal;
    }

    if (fin.read(&v32, 4, 1) != 1) { return retVal; }
    mosSize = get32u_le(&v32);
    if (mosSize < 24) {
      std::printf("MOS size too small\n");
      return retVal;
    }

    BytePtr ptrMosc(new uint8_t[moscSize], std::default_delete<uint8_t[]>());
    if (fin.read(ptrMosc.get(), 1, moscSize) < moscSize) {
      std::printf("Incomplete or corrupted MOSC file\n");
      return retVal;
    }

    retVal.reset(new uint8_t[mosSize], std::default_delete<uint8_t[]>());
    unsigned size = compress.inflate(ptrMosc.get(), moscSize, retVal.get(), mosSize);
    if (size != mosSize) {
      std::printf("Error while decompressing MOSC input file\n");
      retVal = nullptr;
      return retVal;
    }
  } else if (std::strncmp(id, HEADER_MOS_SIGNATURE, 4) == 0) {   // loading MOS data
    mosSize = fin.getsize();
    if (mosSize < 24) {
      std::printf("MOS size too small\n");
      return false;
    }
    fin.seek(0, SEEK_SET);
    retVal.reset(new uint8_t[mosSize], std::default_delete<uint8_t[]>());
    if (fin.read(retVal.get(), 1, mosSize) != mosSize) {
      retVal = nullptr;
      return retVal;
    }
  } else {
    std::printf("Invalid MOS signature\n");
    return retVal;
  }

  if (retVal != nullptr) {
    // parsing MOS header
    uint32_t inOfs = 0;
    if (std::memcmp(retVal.get()+inOfs, HEADER_MOS_SIGNATURE, 4) != 0) {
      std::printf("Invalid MOS signature\n");
      retVal = nullptr;
      return retVal;
    }
    inOfs += 4;

    if (std::memcmp(retVal.get()+inOfs, HEADER_VERSION_V1, 4) != 0) {
      std::printf("Unsupported MOS version\n");
      retVal = nullptr;
      return retVal;
    }
    inOfs += 4;

    width = get16u_le((uint16_t*)(retVal.get()+inOfs));
    if (width == 0) {
      std::printf("Invalid MOS width\n");
      retVal = nullptr;
      return retVal;
    }
    inOfs += 2;

    height = get16u_le((uint16_t*)(retVal.get()+inOfs));
    if (height == 0) {
      std::printf("Invalid MOS height\n");
      retVal = nullptr;
      return retVal;
    }
    inOfs += 2;

    if (get16u_le((uint16_t*)(retVal.get()+inOfs)) == 0) {
      std::printf("Invalid number of tiles\n");
      retVal = nullptr;
      return retVal;
    }
    inOfs += 2;

    if (get16u_le((uint16_t*)(retVal.get()+inOfs)) == 0) {
      std::printf("Invalid number of tiles\n");
      retVal = nullptr;
      return retVal;
    }
    inOfs += 2;

    if (get32u_le((uint32_t*)(retVal.get()+inOfs)) != 0x40) {
      std::printf("Invalid tile dimensions\n");
      retVal = nullptr;
      return retVal;
    }
    inOfs += 4;

    palOfs = get32u_le((uint32_t*)(retVal.get()+inOfs));
    if (palOfs < 24) {
      std::printf("MOS header too small\n");
      retVal = nullptr;
      return retVal;
    }
    inOfs = palOfs;

    unsigned cols = (width+63) >> 6;
    unsigned rows = (height+63) >> 6;
    // comparing calculated size with actual input file length
    uint32_t size = palOfs + cols*rows*PALETTE_SIZE + cols*rows*4 + width*height;
    if (mosSize < size) {
      std::printf("Incomplete or corrupted MOS file\n");
      retVal = nullptr;
      return retVal;
    }
  }
  return retVal;
}

bool Graphics::writeMosV1(File &fout, BytePtr mosData, size_t mosSize) noexcept
{
  bool retVal = false;
  if (mosData != nullptr && mosSize > 0x18) {
    if (getOptions().isMosc()) {
      size_t moscSize = mosSize * 2;
      BytePtr ptrMosc(new uint8_t[moscSize], std::default_delete<uint8_t[]>());
      Compression compress;
      moscSize = compress.deflate(mosData.get(), mosSize, ptrMosc.get() + 12, moscSize);
      if (moscSize > 0) {
        std::memcpy(ptrMosc.get(), HEADER_MOSC_SIGNATURE, 4);
        std::memcpy(ptrMosc.get() + 4, HEADER_VERSION_V1, 4);
        uint32_t v32 = mosSize; v32 = get32u_le(&v32);
        std::memcpy(ptrMosc.get() + 8, &v32, 4);
        retVal = (fout.write(ptrMosc.get(), 1, 12+moscSize) == 12+moscSize);
      }
    } else {
      retVal = (fout.write(mosData.get(), 1, mosSize) == mosSize);
    }
  }
  return retVal;
}

bool Graphics::writePvrz(File &fout, BytePtr data, int width, int height, Encoding encoding) noexcept
{
  bool retVal = false;
  if (data != nullptr && width > 0 && height > 0 && (width & 3) == 0 && (height & 3) == 0 &&
      encoding != Encoding::UNKNOWN) {
    size_t dataSize = Texture::CalculateDataBlockSize(width, height, encoding);
    if (dataSize > 0) {
      size_t headerSize = 0x34;
      size_t pvrSize = headerSize + dataSize;
      BytePtr ptrPvr(new uint8_t[pvrSize], std::default_delete<uint8_t[]>());
      uint32_t v32;

      // initializing header
      v32 = 0x03525650; v32 = get32u_le(&v32);
      memcpy(ptrPvr.get() + 0, &v32, 4);        // signature
      v32 = 0;
      memcpy(ptrPvr.get() + 4, &v32, 4);        // flags
      switch (encoding) {
        case Encoding::BC1: v32 = 7; break;
        case Encoding::BC2: v32 = 9; break;
        case Encoding::BC3: v32 = 11; break;
        default:            return false;
      }
      v32 = get32u_le(&v32);
      memcpy(ptrPvr.get() + 8, &v32, 4);        // pixel format
      v32 = 0;
      memcpy(ptrPvr.get() + 12, &v32, 4);       // extended pixel format
      memcpy(ptrPvr.get() + 16, &v32, 4);       // color space
      memcpy(ptrPvr.get() + 20, &v32, 4);       // channel type
      v32 = height; v32 = get32u_le(&v32);
      memcpy(ptrPvr.get() + 24, &v32, 4);       // height
      v32 = width; v32 = get32u_le(&v32);
      memcpy(ptrPvr.get() + 28, &v32, 4);       // width
      v32 = 1; v32 = get32u_le(&v32);
      memcpy(ptrPvr.get() + 32, &v32, 4);       // texture depth
      memcpy(ptrPvr.get() + 36, &v32, 4);       // surfaces
      memcpy(ptrPvr.get() + 40, &v32, 4);       // faces
      memcpy(ptrPvr.get() + 44, &v32, 4);       // mipmap levels
      v32 = 0;
      memcpy(ptrPvr.get() + 48, &v32, 4);       // meta data size

      // initializing data
      memcpy(ptrPvr.get() + headerSize, data.get(), dataSize);

      // compressing PVR texture
      size_t pvrzSize = pvrSize * 2;
      BytePtr ptrPvrz(new uint8_t[pvrzSize], std::default_delete<uint8_t[]>());
      Compression compress;
      pvrzSize = compress.deflate(ptrPvr.get(), pvrSize, ptrPvrz.get() + 4, pvrzSize);
      if (pvrzSize > 0) {
        v32 = pvrSize; v32 = get32u_le(&v32);
        memcpy(ptrPvrz.get() + 0, &v32, 4);
        retVal = (fout.write(ptrPvrz.get(), 1, pvrzSize+4) == pvrzSize+4);
      } else {
        retVal = false;
      }
    }
  }
  return retVal;
}

int Graphics::findFreePvrzIndex(const std::string outFile, int startIndex) noexcept
{
  if (!getOptions().isOverwritePvrz()) {
    int baseIdx = getOptions().getMosIndex();
    int start = startIndex;
    int end = start + 1000;
    for (int i = start; i < end; i++) {
      std::string fileName = Options::GenerateMosPvrzName(outFile, baseIdx + i);
      if (!File::Exists(fileName)) {
        startIndex = i;
        break;
      }
    }
  }
    return startIndex;
}


unsigned Graphics::showProgress(unsigned curTile, unsigned maxTiles,
                                unsigned curProgress, unsigned maxProgress,
                                char symbol) const noexcept
{
  curTile++;
  if (curTile > maxTiles) curTile = maxTiles;
  if (curProgress > maxProgress) curProgress = maxProgress;
  unsigned v = curTile*maxProgress / maxTiles;
  while (curProgress < v) {
    std::printf("%c", symbol);
#ifndef WIN32
    std::fflush(stdout);
#endif
    curProgress++;
  }
  return v;
}

}   // namespace tc
