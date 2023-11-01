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
#ifndef _CONVERTER_HPP_
#define _CONVERTER_HPP_
#include <memory>
#include "Types.hpp"
#include "Options.hpp"

namespace tc {

/** Base class for pixel encoder and decoder. */
class Converter
{
public:
  virtual ~Converter() noexcept;

  /** Indicates support for decoding pixel data. */
  virtual bool canEncode() const noexcept = 0;
  /** Indicates support for decoding pixel data. */
  virtual bool canDecode() const noexcept = 0;

  /** Returns whether deflating pixel encoded tiles may further reduce size. */
  virtual bool deflateAllowed() const noexcept = 0;

  /** Read-only access to options. */
  const Options& getOptions() const noexcept { return m_options; }

  /** Indicates whether to encode or decode. */
  void setEncoding(bool b) noexcept { m_encoding = b; }
  bool isEncoding() const noexcept { return m_encoding; }

  /** Source (decoding) or target (encoding) pixel encoding type. */
  void setType(Encoding type) noexcept { m_type = type; }
  Encoding getType() const noexcept { return m_type; }

  /** Assumed source (decoding) or target (encoding) color format assumed for pixel (or palette) data. */
  void setColorFormat(ColorFormat fmt) noexcept { m_colorFormat = fmt; }
  ColorFormat getColorFormat() const noexcept { return m_colorFormat; }

  /** Returns image dimensions in pixels. (Implementation-specific). */
  int getWidth() const noexcept { return m_width; }
  int getHeight() const noexcept { return m_height; }

  /**
   * Returns the required space of the currently selected pixel encoding type for the given
   * image dimensions, or 0 on error.
   */
  virtual int getRequiredSpace(int width, int height) const noexcept = 0;

  /** Returns the given value expanded to the nearest supported value. (implementation-specific) */
  virtual int getPaddedValue(int v) const noexcept { return v; }

  /**
   * Executes the conversion process. palette/indexed pixels are either source (encoding) or
   * target (decoding).
   * \param palette Pointer to a palette of 256 colors (using current color format).
   * \param indexed Pointer to 8-bit indexed pixel data.
   * \param argb Pointer to encoded data.
   * \param width Block width in pixels.
   * \param height Block height in pixels.
   * \return Total size of resulting data or 0 on error.
   */
  virtual int convert(uint8_t *palette, uint8_t *indexed, uint8_t *encoded, int width, int height) noexcept = 0;

  /**
   * Executes the conversion process. "argb" is either source (encoding) or target (decoding).
   * \param encoded Pointer to encoded pixel data.
   * \param argb Pointer to uncompressed ARGB pixel data.
   * \param width Block width in pixels.
   * \param height Block height in pixels.
   * \return Total size of resulting data or 0 on error.
   */
  virtual int convert(uint8_t *encoded, uint8_t *argb, int width, int height) noexcept = 0;

  /**
   * Dimensions of a pixel data block will be expanded to the specified dimensions.
   * \param src Source block containing 32-bit pixels.
   * \param dst Storage for resulting pixel block after expanding.
   * \param srcWidth Width of source pixel block.
   * \param srcHeight Height of source pixel block.
   * \param dstWidth Resulting width of target pixel block. Must be >= srcWidth!
   * \param dstHeight Resulting height of target pixel block. Must be >= srcHeight!
   * \param useCopy If true, uses previous pixel values for expanded pixel data,
   *                use transparency/black otherwise.
   * \return Number of resulting pixels in dst, or 0 on error.
   */
  static unsigned PadBlock(const uint8_t *src, uint8_t *dst, int srcWidth, int srcHeight,
                           int dstWidth, int dstHeight, bool useCopy) noexcept;

  /**
   * Dimensions of a pixel data block will be reduced to the specified dimensions.
   * \param src Source block containing 32-bit pixels.
   * \param dst Storage for resulting pixel block after reduction.
   * \param srcWidth Width of source pixel block.
   * \param srcHeight Height of source pixel block.
   * \param dstWidth Resulting width of target pixel block. Must be <= srcWidth!
   * \param dstHeight Resulting height of target pixel block. Must be <= srcHeight!
   * \return Number of resulting pixels in dst, or 0 on error.
   */
  static unsigned UnpadBlock(const uint8_t *src, uint8_t *dst, int srcWidth, int srcHeight,
                             int dstWidth, int dstHeight) noexcept;

  /**
   * Reorders the components in-place from one color format into another.
   * \param buffer The buffer containing 32-bit pixels in "from" order.
   * \param size The number of pixels in the buffer.
   * \param from The source color format.
   * \param to The target color format.
   * \return Success state.
   */
  static bool ReorderColors(uint8_t *buffer, unsigned numPixels, ColorFormat from, ColorFormat to) noexcept;

protected:
  Converter(const Options& options, Encoding type) noexcept;

  // Set image dimensions
  void setWidth(int w) noexcept;
  void setHeight(int h) noexcept;

private:
  const Options&  m_options;      // read-only access to options
  bool            m_encoding;     // indicates conversion type (encoding to or decoding from)
  ColorFormat     m_colorFormat;  // color format for input/output pixel data
  Encoding        m_type;         // encoding type
  int             m_width;
  int             m_height;
};

typedef std::shared_ptr<Converter> ConverterPtr;

}   // namespace tc

#endif		// _CONVERTER_HPP_
