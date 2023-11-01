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
#ifndef _TEXTURE_H_
#define _TEXTURE_H_
#include "Types.hpp"
#include "File.hpp"
#include "Converter.hpp"

namespace tc {

/**
 * Texture management class
 */
class Texture
{
public:
  /**
   * Returns number of bytes needed to hold an uncompressed block of data of the given dimension.
   * Returns 0 on error.
   */
  static size_t CalculateDataBlockSize(int width, int height) noexcept;

  /**
   * Returns number of bytes needed to hold an encoded block of data of the given dimension.
   * Note: Specifying Encoding::UNKNOWN calculates size for uncompressed data of 32-bit pixels.
   * Returns 0 on error.
   */
  static size_t CalculateDataBlockSize(int width, int height, Encoding encoding) noexcept;

  /** Returns true if the specified value is a power of two value. */
  static bool isPowerOfTwo(int value) noexcept;

  // Returns a single encoded data block of "black" in the current color format.
  static uint32_t GetEmptyPixel(ColorFormat format) noexcept;

public:
  /**
   * Create a texture of given width and height in the specified color format.
   */
  Texture(const Options& options, int width, int height) noexcept;
  Texture(const Options& options, int width, int height, ColorFormat format) noexcept;
  Texture(const Options& options, File &pvrzFile) noexcept;
  Texture(const Options& options, File &pvrzFile, ColorFormat format) noexcept;

  Texture(const Texture &obj) noexcept;

  ~Texture() noexcept;

  /**
   * Discards current texture data and creates a new texture in the given color format.
   * Returns true on success.
   */
  bool init(int width, int height) noexcept { return init(width, height, DEFAULT_FORMAT); }

  /**
   * Discards current texture data and creates a new texture in the given color format.
   * Returns true on success.
   */
  bool init(int width, int height, ColorFormat format) noexcept;

  /** Initialize texture with the data from the specified PVRZ file using default color format. */
  bool loadPvrz(File &fin) noexcept { return loadPvrz(fin, DEFAULT_FORMAT); }

  /** Initialize texture with the data from the specified PVRZ file. */
  bool loadPvrz(File &fin, ColorFormat format) noexcept;

  /** Write texture as PVRZ into the specified file. */
  bool savePvrz(File &fout) const noexcept;

  /** Returns current texture width in pixels. */
  int getWidth() const noexcept { return m_width; }

  /** Returns current texture height in pixels. */
  int getHeight() const noexcept { return m_height; }

  /** Sets an index value that can be used to identify the texture. */
  void setIndex(int index) noexcept { m_index = index; }

  /** Returns the current index value. */
  int getIndex() const noexcept { return m_index; }

  /** Returns the color format of the pixel data. */
  ColorFormat getColorFormat() const noexcept { return m_format; }

  /** Set color format of the current (and future) pixel data. */
  ColorFormat setColorFormat(ColorFormat format) noexcept;

  /** Returns encoding to be used for this texture. */
  Encoding getEncoding() const noexcept { return m_encoding; }

  /** Set encoding used for this texture. */
  void setEncoding(Encoding encoding) noexcept { m_encoding = encoding; }

  /**
   * Writes pixels data specified by the given parameters into "output".
   * Returns true on success and false on error.
   */
  bool getDataBlock(int x, int y, int width, int height, BytePtr output) const noexcept;

  /**
   * Writes pixel data from "input" into the texture at the given position using the specified
   * width and height.
   * Return true on success and false if operation could not be executed.
   */
  bool setDataBlock(int x, int y, int width, int height, BytePtr input) noexcept;

  /** Provides direct access to the texture data. */
  BytePtr getData() const noexcept { return m_data; }

  /** Attempts to resize the current texture to the specified dimensions. */
  bool resizeTexture(int newWidth, int newHeight) noexcept;

private:
  // Returns whether position and dimensions are valid, within current texture and a multiple of 4.
  bool checkRectangle(int x, int y, int width, int height) const noexcept {
    return !(x < 0 || y < 0 || width < 1 || height < 1 ||
             x+width > getWidth() || y+height > getHeight());
  }

private:
  static const ColorFormat DEFAULT_FORMAT;

  const Options&  m_options;
  ColorFormat     m_format;     // Color order of pixels
  Encoding        m_encoding;   // the encoding to use for this texture
  int             m_width;      // texture width in pixels
  int             m_height;     // texture height in pixels
  int             m_index;      // an index value that can be used to identify the texture
  BytePtr         m_data;       // texture data
};

}   // namespace tc

#endif		// _TEXTURE_H_
