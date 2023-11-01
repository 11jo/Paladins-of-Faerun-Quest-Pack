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
#ifndef _TILEDATA_HPP_
#define _TILEDATA_HPP_
#include <string>
#include "Types.hpp"
#include "Options.hpp"


namespace tc {

/**
 * Stores all required information and data for converting a single tile of graphics data.
 */
class TileData
{
public:
  explicit TileData(const Options &options) noexcept;
  TileData(const TileData &obj) noexcept;
  ~TileData() noexcept;

  // Process tile data.
  TileData& operator()() noexcept;

  /** Read-only access to Options methods. */
  const Options& getOptions() const noexcept { return m_options; }

  /** Indicates the type of the input data. */
  void setInputType(FileType type) noexcept { m_inputType = type; }
  FileType getInputType() const noexcept { return m_inputType; }

  /** The encoding type of output data (to V2 only). */
  void setEncoding(Encoding encoding) noexcept { m_encoding = encoding; }
  Encoding getEncoding() const noexcept { return m_encoding; }

  /** The index associated with this tile (>= 0). */
  void setIndex(int index) noexcept;
  int getIndex() const noexcept { return m_index; }

  /** The PVRZ page index of this texture/tile. */
  void setPvrzIndex(int index) noexcept { m_pvrzIndex = index; }
  int getPvrzIndex() const noexcept { return m_pvrzIndex; }

  /** Output storage for palette (to V1 only). */
  void setPaletteData(BytePtr palette) noexcept { m_ptrPalette = palette; }
  BytePtr getPaletteData() const noexcept { return m_ptrPalette; }

  /** Storage for input 32-bit pixel data. */
  void setInputData(BytePtr data) noexcept { m_ptrInput = data; }
  BytePtr getInputData() const noexcept { return m_ptrInput; }

  /** Storage for output pixel data (to V1: indexed pixels, to V2: DXTn-encoded data). */
  void setOutputData(BytePtr data) noexcept { m_ptrOutput = data; }
  BytePtr getOutputData() const noexcept { return m_ptrOutput; }

  /** Tile width in pixels. */
  void setWidth(int width) noexcept;
  int getWidth() const noexcept { return m_width; }

  /** Tile height in pixels. */
  void setHeight(int height) noexcept;
  int getHeight() const noexcept { return m_height; }

  /** Return information on error. */
  bool isError() const noexcept { return m_error; }
  const std::string& getErrorMsg() const noexcept { return m_errorMsg; }

  /** Calculate size of palette buffer based on current configuration. */
  int calculatePaletteSize() const noexcept { return 256*4; }
  /** Calculate size of input data buffer based on current configuration. */
  int calculateInputSize() const noexcept;
  /** Calculate size of output data buffer based on current configuration. */
  int calculateOutputSize() const noexcept;

private:
  // Check if data is valid for the encoding or decoding process
  bool isValid() const noexcept;

  // Set error state
  void setError(bool b) noexcept { m_error = b; }
  void setErrorMsg(std::string s) { m_errorMsg = s; }

  // Execute conversion process
  void process() noexcept;

  // specialized conversion routines
  void v1toV2() noexcept;
  void v2toV1() noexcept;

private:
  const Options& m_options;   // read-only reference to options instance
  bool        m_error;        // indicates if an error occurred
  int         m_index;        // the tile index/serial number (starting at 0)
  int         m_width;        // width of the tile in pixels
  int         m_height;       // height of the tile in pixels
  int         m_pvrzIndex;    // the pvrz page index of the texture
  Encoding    m_encoding;     // encoding type of DXT-encoded pixel data (to V1: input data, to V2: output data)
  FileType    m_inputType;    // indicates data type of the input data
  BytePtr     m_ptrPalette;   // storage for palette (to V1: out, to V2: in)
  BytePtr     m_ptrInput;     // storage for input data (to V1: 32-bit pixel data, to V2: indexed pixel data)
  BytePtr     m_ptrOutput;    // storage for output data (to V1: indexed pixel data, to V2: 32-bit pixel data)
  std::string m_errorMsg;     // contains a descriptive message if an error occurred
};

typedef std::shared_ptr<TileData> TileDataPtr;

}   // namespace tc

/** Function object needed for priority queue. */
namespace std {
  template<> struct greater<tc::TileDataPtr> {
    bool operator()(const tc::TileDataPtr &lhs, const tc::TileDataPtr &rhs) const noexcept
    {
      if (lhs != nullptr && rhs != nullptr) {
        return lhs->getIndex() > rhs->getIndex();
      } else {
        return false;
      }
    }
  };
}

#endif		// _TILEDATA_HPP_
