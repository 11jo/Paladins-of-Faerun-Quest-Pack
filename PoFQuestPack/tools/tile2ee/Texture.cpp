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
#include <cstring>
#include "Funcs.hpp"
#include "ConverterDxt.hpp"
#include "Compression.hpp"
#include "Texture.hpp"


namespace tc {

const ColorFormat Texture::DEFAULT_FORMAT = ColorFormat::ARGB;

Texture::Texture(const Options& options, int width, int height) noexcept
: Texture(options, width, height, DEFAULT_FORMAT)
{
}

Texture::Texture(const Options& options, int width, int height, ColorFormat format) noexcept
: m_options(options)
, m_format(format)
, m_encoding(Encoding::BC1)
, m_width(0)
, m_height(0)
, m_index(0)
, m_data(nullptr)
{
  init(width, height, format);
}

Texture::Texture(const Options& options, File &pvrzFile) noexcept
: Texture(options, pvrzFile, DEFAULT_FORMAT)
{
}

Texture::Texture(const Options& options, File &pvrzFile, ColorFormat format) noexcept
: m_options(options)
, m_format(format)
, m_encoding(Encoding::BC1)
, m_width(0)
, m_height(0)
, m_index(0)
, m_data(nullptr)
{
  loadPvrz(pvrzFile, format);
}

Texture::Texture(const Texture &obj) noexcept
: m_options(obj.m_options)
, m_format(obj.m_format)
, m_encoding(obj.m_encoding)
, m_width(obj.m_width)
, m_height(obj.m_height)
, m_index(obj.m_index)
, m_data(obj.m_data)
{
}

Texture::~Texture() noexcept
{
}

bool Texture::init(int width, int height, ColorFormat format) noexcept
{
  if (m_data != nullptr) {
    m_data = nullptr;
  }

  m_width = width;
  m_height = height;
  m_format = format;
  size_t size = CalculateDataBlockSize(getWidth(), getHeight());
  if (size > 0) {
    m_data.reset(new uint8_t[size], std::default_delete<uint8_t[]>());

    // filling texture with black color
    size_t count = m_width*m_height;
    uint32_t pixel = GetEmptyPixel(getColorFormat()); pixel = get32u_le(&pixel);
    uint32_t *ofs = (uint32_t*)m_data.get();
    for (size_t i = 0; i < count; i++, ofs++) {
      *ofs = pixel;
    }

    return true;
  }
  return false;
}

bool Texture::loadPvrz(File &fin, ColorFormat format) noexcept
{
  uint32_t v32;

  // reading uncompressed file size
  if (fin.read(&v32, 4, 1) != 1) { return false; }
  v32 = get32u_le(&v32);
  size_t pvrSize = v32;
  size_t headerSize = 0x34;
  if (v32 <= headerSize) {
    return false;
  }
  size_t dataSize = pvrSize - headerSize;

  // decompressing PVR header and data
  size_t pvrzSize = fin.getsize() - 4;
  BytePtr ptrPvrz(new uint8_t[pvrSize], std::default_delete<uint8_t[]>());
  if (fin.read(ptrPvrz.get(), 1, pvrzSize) != pvrzSize) {
    return false;
  }
  BytePtr ptrPvr(new uint8_t[pvrSize], std::default_delete<uint8_t[]>());
  Compression compress;
  if (compress.inflate(ptrPvrz.get(), pvrzSize, ptrPvr.get(), pvrSize) != pvrSize) {
    return false;
  }

  size_t curOfs = 0;

  // parsing PVR header
  Encoding encoding;
  int width = 0, height = 0;
  std::memcpy(&v32, ptrPvr.get() + curOfs, 4); curOfs += 4; // signature
  v32 = get32u_le(&v32);
  if (v32 != 0x03525650) { return false; }
  std::memcpy(&v32, ptrPvr.get() + curOfs, 4); curOfs += 4; // flags (ignored)
  std::memcpy(&v32, ptrPvr.get() + curOfs, 4); curOfs += 4; // pixel format
  v32 = get32u_le(&v32);
  switch (v32) {
    case 7:  encoding = Encoding::BC1; break;
    case 9:  encoding = Encoding::BC2; break;
    case 11: encoding = Encoding::BC3; break;
    default: return false;
  }
  std::memcpy(&v32, ptrPvr.get() + curOfs, 4); curOfs += 4; // extended pixel format (ignored)
  std::memcpy(&v32, ptrPvr.get() + curOfs, 4); curOfs += 4; // color space
  if (v32 != 0) { return false; }
  std::memcpy(&v32, ptrPvr.get() + curOfs, 4); curOfs += 4; // channel type
  if (v32 != 0) { return false; }
  std::memcpy(&v32, ptrPvr.get() + curOfs, 4); curOfs += 4; // height
  height = get32u_le(&v32);
  if (height <= 0 || !isPowerOfTwo(height)) { return false; }
  std::memcpy(&v32, ptrPvr.get() + curOfs, 4); curOfs += 4; // width
  width = get32u_le(&v32);
  if (width <= 0 || !isPowerOfTwo(width)) { return false; }
  // texture depth, surfaces, faces and mipmap levels
  for (int i = 0; i < 4; i++) {
    std::memcpy(&v32, ptrPvr.get() + curOfs, 4); curOfs += 4; // must be 1
    v32 = get32u_le(&v32);
    if (v32 != 1) {
      return false;
    }
  }
  std::memcpy(&v32, ptrPvr.get() + curOfs, 4); curOfs += 4; // meta data size
  v32 = get32u_le(&v32);
  if (v32 > 0) {
    // skipping meta data
    dataSize -= v32;
    curOfs += v32;
  }

  // loading texture data
  if (!init(width, height, format)) {
    return false;
  }

  ConverterPtr converter(new ConverterDxt(m_options, encoding));
  converter->setEncoding(false);
  converter->setColorFormat(format);
  return (0 != converter->convert(ptrPvr.get() + curOfs, getData().get(), width, height));
}

bool Texture::savePvrz(File &fout) const noexcept
{
  if (getEncoding() == Encoding::UNKNOWN) {
    return false;
  }

  uint32_t v32;

  size_t pvrSize = 0x34 + CalculateDataBlockSize(getWidth(), getHeight(), getEncoding());
  BytePtr ptrPvr(new uint8_t[pvrSize], std::default_delete<uint8_t[]>());

  // initializing header
  v32 = 0x03525650; v32 = get32u_le(&v32);
  memcpy(ptrPvr.get() + 0, &v32, 4);        // signature
  v32 = 0;
  memcpy(ptrPvr.get() + 4, &v32, 4);        // flags
  switch (getEncoding()) {
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
  v32 = getHeight(); v32 = get32u_le(&v32);
  memcpy(ptrPvr.get() + 24, &v32, 4);       // height
  v32 = getWidth(); v32 = get32u_le(&v32);
  memcpy(ptrPvr.get() + 28, &v32, 4);       // width
  v32 = 1; v32 = get32u_le(&v32);
  memcpy(ptrPvr.get() + 32, &v32, 4);       // texture depth
  memcpy(ptrPvr.get() + 36, &v32, 4);       // surfaces
  memcpy(ptrPvr.get() + 40, &v32, 4);       // faces
  memcpy(ptrPvr.get() + 44, &v32, 4);       // mipmap levels
  v32 = 0;
  memcpy(ptrPvr.get() + 48, &v32, 4);       // meta data size

  // encoding pixel data
  ConverterPtr converter(new ConverterDxt(m_options, getEncoding()));
  converter->setEncoding(true);
  converter->setColorFormat(getColorFormat());
  bool retVal = (0 != converter->convert(ptrPvr.get() + 0x34, getData().get(), getWidth(), getHeight()));

  // compressing PVR texture
  if (retVal) {
    size_t pvrzSize = pvrSize * 2;
    BytePtr ptrPvrz(new uint8_t[pvrzSize], std::default_delete<uint8_t[]>());
    Compression compress;
    pvrzSize = compress.deflate(ptrPvr.get(), pvrSize, ptrPvrz.get() + 4, pvrzSize);
    if (pvrzSize > 0) {
      v32 = pvrzSize; v32 = get32u_le(&v32);
      memcpy(ptrPvrz.get() + 0, &v32, 4);
      retVal = (fout.write(ptrPvrz.get(), 1, pvrzSize+4) == pvrzSize+4);
    } else {
      retVal = false;
    }
  }

  return retVal;
}

bool Texture::getDataBlock(int x, int y, int width, int height, BytePtr output) const noexcept
{
  if (checkRectangle(x, y, width, height) && output != nullptr) {
    int srcStride = getWidth() * 4;
    int dstStride = width * 4;
    int srcOfs = (y*getWidth() + x) * 4;
    int dstOfs = 0;
    for (int row = 0; row < height; row++) {
      std::memcpy(output.get() + dstOfs, m_data.get() + srcOfs, dstStride);
      srcOfs += srcStride;
      dstOfs += dstStride;
    }
    return true;
  }
  return false;
}

bool Texture::setDataBlock(int x, int y, int width, int height, BytePtr input) noexcept
{
  if (checkRectangle(x, y, width, height) && input != nullptr) {
    int srcStride = width * 4;
    int dstStride = getWidth() * 4;
    int srcOfs = 0;
    int dstOfs = (y*getWidth() + x) * 4;
    for (int row = 0; row < height; row++) {
      std::memcpy(m_data.get() + dstOfs, input.get() + srcOfs, srcStride);
      srcOfs += srcStride;
      dstOfs += dstStride;
    }
    return true;
  }
  return false;
}


bool Texture::resizeTexture(int newWidth, int newHeight) noexcept
{
  if (newWidth > 0 && newHeight > 0) {
    if (newWidth == getWidth() && newHeight == getHeight()) {
      return true;
    }

    size_t newSize = CalculateDataBlockSize(newWidth, newHeight);
    if (newSize > 0) {
      BytePtr ptrNewData(new uint8_t[newSize], std::default_delete<uint8_t[]>());

      // filling new texture with Dxt-encoded "black"
      size_t numPixels = newWidth*newHeight;
      uint32_t pixel = GetEmptyPixel(getColorFormat()); pixel = get32u_le(&pixel);
      uint32_t *ofs = (uint32_t*)ptrNewData.get();
      for (size_t i = 0; i < numPixels; i++, ofs++) {
        *ofs = pixel;
      }

      // copying old data into new texture
      int srcStride = getWidth() * 4;
      int oldHeight = getHeight();
      int dstStride = newWidth * 4;
      int minStride = std::min(srcStride, dstStride);
      int minHeight = std::min(oldHeight, newHeight);
      uint8_t *srcOfs = m_data.get();
      uint8_t *dstOfs = ptrNewData.get();
      for (int y = 0; y < minHeight; y++) {
        std::memcpy(dstOfs, srcOfs, minStride);
        srcOfs += srcStride;
        dstOfs += dstStride;
      }

      m_width = newWidth;
      m_height = newHeight;
      m_data = ptrNewData;

      return true;
    }
  }
  return false;
}

// ----------------------- STATIC METHODS -----------------------

size_t Texture::CalculateDataBlockSize(int width, int height) noexcept
{
  return CalculateDataBlockSize(width, height, Encoding::UNKNOWN);
}

size_t Texture::CalculateDataBlockSize(int width, int height, Encoding encoding) noexcept
{
  if (width > 0 && height > 0) {
    switch (encoding) {
      case Encoding::BC1:
        width = (width + 3) & ~3;
        height = (height + 3) & ~3;
        return (width*height*8/16);
      case Encoding::BC2:
      case Encoding::BC3:
        width = (width + 3) & ~3;
        height = (height + 3) & ~3;
        return width*height;
      default:
        return width*height*4;
    }
  }
  return 0;
}

bool Texture::isPowerOfTwo(int value) noexcept
{
  for (size_t i = 0; i < sizeof(int)*8; i++) {
    if ((1 << i) == value) {
      return true;
    }
  }
  return false;
}

uint32_t Texture::GetEmptyPixel(ColorFormat format) noexcept
{
  uint32_t retVal;
  switch (format) {
    case ColorFormat::BGRA:
    case ColorFormat::RGBA:
      retVal = 0x000000ff;
      break;
    default:
      retVal = 0xff000000;
      break;
  }
  return get32u_le(&retVal);
}

}   // namespace tc
