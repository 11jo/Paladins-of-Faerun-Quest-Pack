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
#ifndef _GRAPHICS_HPP_
#define _GRAPHICS_HPP_
#include <string>
#include "Types.hpp"
#include "Options.hpp"
#include "File.hpp"
#include "BinPack2D.hpp"
#include "TileData.hpp"
#include "Texture.hpp"


namespace tc {

/** Provides functions for converting between TIS/MOS V1 <-> TIS/MOS V2*/
class Graphics
{
public:
  Graphics(Options &options) noexcept;
  ~Graphics() noexcept;

  /** TIS V1 -> TIS V2 conversion */
  bool tisV1ToTisV2(const std::string &inFile, const std::string &outFile) noexcept;
  /** TIS V2 -> TIS V1 conversion */
  bool tisV2ToTisV1(const std::string &inFile, const std::string &outFile) noexcept;
  /**
   * MOS V1 -> MOS V2 conversion
   * \param pvrzIndexFirst Specify the first pvrz index to use.
   * \param pvrzIndexLast [out] Returns the last used pvrz index.
   */
  bool mosV1ToMosV2(const std::string &inFile, const std::string &outFile,
                    int pvrzIndexFirst, int &pvrzIndexLast) noexcept;
  /** MOS V1 -> MOS V2 conversion */
  bool mosV2ToMosV1(const std::string &inFile, const std::string &outFile) noexcept;

  /** Read-only access to Options structure. */
  Options& getOptions() const noexcept { return m_options; }

private:
  /** Converts paletted data into 32-bit pixel data. */
  bool paletteToPixels(BytePtr pal, BytePtr indexed, BytePtr pixels, int width, int height) noexcept;

  // Read TIS header data. v1 indicates whether to assume TIS V1. File points to start of tile data afterwards.
  bool readTisHeader(File &fin, bool v1, unsigned &numTiles) noexcept;
  // Reads compressed or uncompressed MOS from specified file. Returns pointer to uncompressed MOS data.
  BytePtr readMosV1(File &fin, unsigned &width, unsigned &height, unsigned &palOfs) noexcept;

  // Writes MOS as MOS V1 or MOSC to disk.
  bool writeMosV1(File &fout, BytePtr mosData, size_t mosSize) noexcept;

  // Write data to TIS V1 output file
  bool writeTisV1Tile(TileDataPtr tileData, File &fout) noexcept;

  // Write encoded pixel data as PVRZ file
  bool writePvrz(File &fout, BytePtr data, int width, int height, Encoding encoding) noexcept;

  // Attempts to find an unused pvrz index for MOS files.
  int findFreePvrzIndex(const std::string outFile, int startIndex) noexcept;

  // Update the progression of a progress bar. Returns updated curProgress.
  unsigned showProgress(unsigned curTile, unsigned maxTiles,
                        unsigned curProgress, unsigned maxProgress,
                        char symbol) const noexcept;

public:
  static const char HEADER_TIS_SIGNATURE[4];          // TIS signature
  static const char HEADER_MOS_SIGNATURE[4];          // MOS signature
  static const char HEADER_MOSC_SIGNATURE[4];         // MOSC signature
  static const char HEADER_VERSION_V1[4];             // TIS/MOS file version
  static const char HEADER_VERSION_V2[4];             // TIS/MOS file version

private:
  static const unsigned MAX_PROGRESS;                 // Available space for a progress bar
  static const unsigned MAX_POOL_TILES;               // Max. storage of tiles in thread pool

  static const BinPack2D::HeuristicRules BIN_RULE;

  Options&  m_options;
};

}   // namespace tc

#endif  // _GRAPHICS_HPP_
