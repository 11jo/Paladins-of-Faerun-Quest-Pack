/*
 * Copyright (C) 2012   argent77
 *
 * This file is part of tile2ee.
 *
 * tile2ee is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * tile2ee is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with tile2ee.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <cstring>
#include "Funcs.hpp"
#include "Graphics.hpp"
#include "Compression.hpp"
#include "Tile2EE.hpp"

int main(int argc, char *argv[])
{
  tc::Tile2EE tile2EE(argc, argv);
  if (tile2EE.execute()) {
    return 0;
  } else {
    return 1;
  }
}

namespace tc {

Tile2EE::Tile2EE(int argc, char *argv[]) noexcept
: m_options()
, m_initialized()
{
  init(argc, argv);
}

Tile2EE::~Tile2EE() noexcept
{
}

bool Tile2EE::init(int argc, char *argv[]) noexcept
{
  return (m_initialized = m_options.init(argc, argv));
}

bool Tile2EE::execute() noexcept
{
  // checking state
  if (!isInitialized()) {
    return false;
  }
  if (getOptions().getInputCount() == 0) {
    return false;
  }

  // Special case: display information about input files only
  if (getOptions().isShowInfo()) {
    for (int i = 0; i < getOptions().getInputCount(); i++) {
      showInfo(getOptions().getInput(i));
      std::printf("\n");
    }
    return true;
  }

  // Starting actual conversion process
  if (!getOptions().isSilent()) {
    std::printf("Options: %s\n", getOptions().getOptionsSummary(true).c_str());
  }

  Graphics gfx(getOptions());
  bool retVal = true;
  int pvrzIndex = getOptions().getMosIndex();
  for (int i = 0; i < getOptions().getInputCount(); i++) {
    if (!getOptions().isSilent() && getOptions().getInputCount() > 1) {
      std::printf("\nProcessing file %d of %d\n", i+1, getOptions().getInputCount());
    }

    const std::string &inputFile = getOptions().getInput(i);
    if (!File::Exists(inputFile)) {
      retVal = false;
      std::printf("File does not exist: \"%s\"\n", inputFile.c_str());
      if (getOptions().isHaltOnError()) {
        return retVal;
      } else {
        continue;
      }
    }

    std::string outputFile;
    if (!inputFile.empty()) {
      FileType fileType = Options::GetFileType(inputFile, getOptions().assumeTis());
      if (fileType == FileType::UNKNOWN) {
        retVal = false;
        std::printf("Unknown file type: \"%s\"\n", inputFile.c_str());
        if (getOptions().isHaltOnError()) {
          return retVal;
        } else {
          continue;
        }
      }

      // checking conversion type
      if (fileType == FileType::TISV1 && getOptions().getConversionType() == 1) {
        if (!getOptions().isSilent()) {
          std::printf("Skipping palette-based TIS file \"%s\"...\n", inputFile.c_str());
        }
        continue;
      } else if (fileType == FileType::MOSV1 && getOptions().getConversionType() == 1) {
        if (!getOptions().isSilent()) {
          std::printf("Skipping palette-based MOS file \"%s\"...\n", inputFile.c_str());
        }
        continue;
      } else if (fileType == FileType::TISV2 && getOptions().getConversionType() == 2) {
        if (!getOptions().isSilent()) {
          std::printf("Skipping pvrz-based TIS file \"%s\"...\n", inputFile.c_str());
        }
        continue;
      } else if (fileType == FileType::MOSV2 && getOptions().getConversionType() == 2) {
        if (!getOptions().isSilent()) {
          std::printf("Skipping pvrz-based MOS file \"%s\"...\n", inputFile.c_str());
        }
        continue;
      }

      // generating output filename
      if (getOptions().isOutFile()) {
        outputFile = File::CreateFileName(getOptions().getOutPath(), getOptions().getOutFile());
      } else {
        outputFile = Options::GetOutputFileName(getOptions().getOutPath(), inputFile, fileType, false);
      }
      if (outputFile.empty()) {
        retVal = false;
        std::printf("Error creating output filename\n");
        if (getOptions().isHaltOnError()) {
          return retVal;
        }
      } else if (File::IsEqual(inputFile, outputFile)) {
        std::printf("Error: Input file and output file are equal: %s\n", inputFile.c_str());
        if (getOptions().isHaltOnError()) {
          return retVal;
        }
      }

      // converting file
      switch (fileType) {
        case FileType::TISV1:
          if (!getOptions().isSilent()) {
            std::printf("Converting TIS V1 -> TIS V2\n");
            std::printf("Input: \"%s\", output: \"%s\"\n", inputFile.c_str(), outputFile.c_str());
          }
          if (!gfx.tisV1ToTisV2(inputFile, outputFile)) {
            retVal = false;
            std::printf("Error while converting \"%s\"\n", inputFile.c_str());
            if (getOptions().isHaltOnError()) {
              return retVal;
            }
          }
          break;
        case FileType::TISV2:
          if (!getOptions().isSilent()) {
            std::printf("Converting TIS V2 -> TIS V1\n");
            std::printf("Input: \"%s\", output: \"%s\"\n", inputFile.c_str(), outputFile.c_str());
          }
          if (!gfx.tisV2ToTisV1(inputFile, outputFile)) {
            retVal = false;
            std::printf("Error while converting \"%s\"\n", inputFile.c_str());
            if (getOptions().isHaltOnError()) {
              return retVal;
            }
          }
          break;
        case FileType::MOSV1:
          if (!getOptions().isSilent()) {
            std::printf("Converting MOS V1 -> MOS V2\n");
            std::printf("Input: \"%s\", output: \"%s\"\n", inputFile.c_str(), outputFile.c_str());
          }
          if (!gfx.mosV1ToMosV2(inputFile, outputFile, pvrzIndex, pvrzIndex)) {
            retVal = false;
            std::printf("Error while converting \"%s\"\n", inputFile.c_str());
            if (getOptions().isHaltOnError()) {
              return retVal;
            }
          } else {
            pvrzIndex++;
          }
          break;
        case FileType::MOSV2:
          if (!getOptions().isSilent()) {
            std::printf("Converting MOS V2 -> MOS V1\n");
            std::printf("Input: \"%s\", output: \"%s\"\n", inputFile.c_str(), outputFile.c_str());
          }
          if (!gfx.mosV2ToMosV1(inputFile, outputFile)) {
            retVal = false;
            std::printf("Error while converting \"%s\"\n", inputFile.c_str());
            if (getOptions().isHaltOnError()) {
              return retVal;
            }
          }
          break;
        default:
          retVal = false;
          std::printf("Unknown file type: \"%s\"\n", inputFile.c_str());
          if (getOptions().isHaltOnError()) {
            return retVal;
          }
          break;
      }
    }
  }

  return retVal;
}

bool Tile2EE::showInfo(const std::string &fileName) noexcept
{
  if (!fileName.empty()) {
    std::printf("Parsing \"%s\"...\n", fileName.c_str());
    File f(fileName.c_str(), "rb");
    if (!f.error()) {
      char sig[4], ver[4];

      if (f.read(sig, 1, 4) != 4) {
        return false;
      }

      if (std::strncmp(sig, Graphics::HEADER_TIS_SIGNATURE, 4) == 0) {
        // Display TIS information
        uint32_t numTiles, tileSize;

        if (f.read(ver, 1, 4) != 4) {
          return false;
        }

        if (std::strncmp(ver, Graphics::HEADER_VERSION_V1, 4) != 0 &&
            std::strncmp(ver, Graphics::HEADER_VERSION_V2, 4) != 0) {
          std::printf("Invalid TIS version.\n");
          return false;
        }

        if (f.read(&numTiles, 4, 1) != 1 || f.read(&tileSize, 4, 1) != 1) {
          return false;
        }
        numTiles = get32u_le(&numTiles);
        tileSize = get32u_le(&tileSize);

        switch (tileSize) {
          case 0x1400:
            std::printf("File type:       TIS V1 (palette-based)\n");
            break;
          case 0x000c:
            std::printf("File type:       TIS V2 (pvrz-based)\n");
            break;
          default:
            std::printf("File type:       TIS (unsupported version)\n");
            break;
        }
        std::printf("Number of tiles: %d\n", numTiles);
      } else if (std::strncmp(sig, Graphics::HEADER_MOS_SIGNATURE, 4) == 0 ||
                 std::strncmp(sig, Graphics::HEADER_MOSC_SIGNATURE, 4) == 0) {
        // Display MOS information
        BytePtr mosData(nullptr);
        bool isMosc = (std::strncmp(sig, Graphics::HEADER_MOSC_SIGNATURE, 4) == 0);
        uint32_t mosSize, width, height, cols, rows, numBlocks;

        if (f.read(ver, 1, 4) != 4) {
          return false;
        }

        if (isMosc) {
          // decode MOSC into memory
          uint32_t moscSize;
          Compression compression;

          // getting MOSC file size
          moscSize = f.getsize();
          if (moscSize <= 12) {
            std::printf("Invalid MOSC size\n");
            return false;
          }
          moscSize -= 12;    // removing header size
          f.seek(4, SEEK_SET);
          if (f.read(&ver, 1, 4) != 4) return false;
          if (std::strncmp(ver, Graphics::HEADER_VERSION_V1, 4) != 0) {
            std::printf("Invalid MOSC version.\n");
            return false;
          }
          if (f.read(&mosSize, 4, 1) != 1) return false;
          mosSize = get32u_le(&mosSize);
          if (mosSize < 24) {
            std::printf("MOS size too small.\n");
            return false;
          }

          // loading and decompressing MOS data
          BytePtr moscData(new uint8_t[moscSize], std::default_delete<uint8_t[]>());
          if (f.read(moscData.get(), 1, moscSize) < moscSize) {
            std::printf("Incomplete or corrupted MOSC file.\n");
            return false;
          }
          mosData.reset(new uint8_t[mosSize], std::default_delete<uint8_t[]>());
          uint32_t size = compression.inflate(moscData.get(), moscSize, mosData.get(), mosSize);
          if (size != mosSize) {
            std::printf("Error while decompressing MOSC input file.\n");
            return false;
          }
        } else {
          // reading MOS header into memory
          mosSize = f.getsize();
          if (mosSize < 24) {
            std::printf("MOS size too small\n");
            return false;
          }
          f.seek(0, SEEK_SET);
          mosData.reset(new uint8_t[24], std::default_delete<uint8_t[]>());
          if (f.read(mosData.get(), 1, 24) != 24) return false;
        }

        int mosVersion;
        std::memcpy(ver, mosData.get()+0x04, 4);
        if (std::strncmp(ver, Graphics::HEADER_VERSION_V1, 4) == 0) {
          mosVersion = 1;
          width = get16u_le((uint16_t*)(mosData.get()+0x08));
          height = get16u_le((uint16_t*)(mosData.get()+0x0a));
          cols = get16u_le((uint16_t*)(mosData.get()+0x0c));
          rows = get16u_le((uint16_t*)(mosData.get()+0x0e));
          numBlocks = 0;
        } else if (std::strncmp(ver, Graphics::HEADER_VERSION_V2, 4) == 0) {
          mosVersion = 2;
          width = get32u_le((uint32_t*)(mosData.get()+0x08));
          height = get32u_le((uint32_t*)(mosData.get()+0x0c));
          numBlocks = get32u_le((uint32_t*)(mosData.get()+0x10));
          cols = rows = 0;
        } else {
          mosVersion = 0;
          width = height = cols = rows = numBlocks = 0;
        }

        switch (mosVersion) {
          case 1:
            std::printf("File type:       MOS V1 (palette-based)\n");
            std::printf("File subtype:    %s\n", isMosc ? "Compressed (MOSC)" : "Uncompressed");
            break;
          case 2:
            std::printf("File type:       MOS V2 (pvrz-based)\n");
            break;
          default:
            std::printf("File type:       MOS (unsupported version)\n");
            break;
        }

        if (mosVersion > 0) {
          std::printf("Width:           %d\n", width);
          std::printf("Height:          %d\n", height);
          if (mosVersion == 1) {
            std::printf("Columns:         %d\n", cols);
            std::printf("Rows:            %d\n", rows);
          } else {
            std::printf("Block count:     %d\n", numBlocks);
          }
        }
      } else if (getOptions().assumeTis()) {
        // Display headerless TIS information
        size_t fileSize = f.getsize();
        unsigned tisVersion, numTiles;

        if ((fileSize % 0x1400) == 0) {
          tisVersion = 1;
          numTiles = fileSize / 0x1400;
        } else if ((fileSize % 0x000c) == 0) {
          tisVersion = 2;
          numTiles = fileSize / 0x000c;
        } else {
          tisVersion = numTiles = 0;
        }

        // Display headerless TIS information
        if (tisVersion > 0) {
          std::printf("File type:       TIS (assumed)\n");
          std::printf("File subtype:    %s\n", (tisVersion == 1) ? "Palette-based" : "PVRZ-based");
          std::printf("Number of tiles: %d\n", numTiles);
        } else {
          std::printf("File type:       Unknown\n");
          return false;
        }
      } else {
        std::printf("File type:       Unknown\n");
        return false;
      }
      return true;
    }
  }
  return false;
}

}		// namespace tc
