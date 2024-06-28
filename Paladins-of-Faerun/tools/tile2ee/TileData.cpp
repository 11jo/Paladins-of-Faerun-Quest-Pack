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
#include <algorithm>
#include <cstring>
#include "Types.hpp"
#include "Funcs.hpp"
#include "Colors.hpp"
#include "Compression.hpp"
#include "ConverterDxt.hpp"
#include "TileData.hpp"

namespace tc {

TileData::TileData(const Options &options) noexcept
: m_options(options)
, m_error(false)
, m_index(-1)
, m_width(0)
, m_height(0)
, m_pvrzIndex(0)
, m_encoding(Encoding::UNKNOWN)
, m_inputType(FileType::UNKNOWN)
, m_ptrPalette(nullptr)
, m_ptrInput(nullptr)
, m_ptrOutput(nullptr)
{
}

TileData::TileData(const TileData &obj) noexcept
: m_options(obj.m_options)
, m_error(obj.m_error)
, m_index(obj.m_index)
, m_width(obj.m_width)
, m_height(obj.m_height)
, m_pvrzIndex(obj.m_pvrzIndex)
, m_encoding(obj.m_encoding)
, m_inputType(obj.m_inputType)
, m_ptrPalette(obj.m_ptrPalette)
, m_ptrInput(obj.m_ptrInput)
, m_ptrOutput(obj.m_ptrOutput)
{
}

TileData::~TileData() noexcept
{
}

TileData& TileData::operator()() noexcept
{
  process();
  return *this;
}

void TileData::setIndex(int index) noexcept
{
  m_index = std::max(0, std::min(std::numeric_limits<int>::max(), index));
}

void TileData::setWidth(int width) noexcept
{
  m_width = std::max(0, std::min(std::numeric_limits<int>::max(), width));
}

void TileData::setHeight(int height) noexcept
{
  m_height = std::max(0, std::min(std::numeric_limits<int>::max(), height));
}

int TileData::calculateInputSize() const noexcept
{
  switch (getInputType()) {
    case FileType::TISV1:
    case FileType::MOSV1:
      return getWidth()*getHeight();
    case FileType::TISV2:
    case FileType::MOSV2:
      return getWidth()*getHeight()*4;
    default:
      return 0;
  }
}

int TileData::calculateOutputSize() const noexcept
{
  switch (getInputType()) {
    case FileType::TISV2:
    case FileType::MOSV2:
      return getWidth()*getHeight();
    case FileType::TISV1:
    case FileType::MOSV1:
      return getWidth()*getHeight()*4;
    default:
      return 0;
  }
}


bool TileData::isValid() const noexcept
{
  if (getInputType() == FileType::MOSV1 || getInputType() == FileType::TISV1) {
    return (m_ptrInput != nullptr && m_ptrOutput != nullptr &&
            m_index >= 0 && m_width > 0 && m_height > 0 && m_encoding != Encoding::UNKNOWN);
  } else if (getInputType() == FileType::MOSV2 || getInputType() == FileType::TISV2) {
    return (m_ptrPalette != nullptr && m_ptrInput != nullptr && m_ptrOutput != nullptr &&
            m_index >= 0 && m_width > 0 && m_height > 0);
  } else {
    return false;
  }
//  return (m_ptrPalette != nullptr && m_ptrInput != nullptr && m_ptrOutput != nullptr &&
//          m_index >= 0 && m_sx >= 0 && m_sy >= 0 && m_dx >= 0 && m_dy >= 0 &&
//          m_width > 0 && m_height > 0 && m_encoding != Encoding::UNKNOWN &&
//          m_inputType != FileType::UNKNOWN);
}

void TileData::process() noexcept
{
  switch (getInputType()) {
    case FileType::TISV1:
    case FileType::MOSV1:
      v1toV2();
      break;
    case FileType::TISV2:
    case FileType::MOSV2:
      v2toV1();
      break;
    default:
      setError(true);
      setErrorMsg("Invalid input type\n");
      break;
  }
}

void TileData::v1toV2() noexcept
{
  if (isValid()) {
    ConverterPtr converter(new ConverterDxt(getOptions(), getEncoding()));
    if (converter != nullptr) {
      converter->setEncoding(true);
      converter->setColorFormat(ColorFormat::ARGB);

      if (!converter->convert(getOutputData().get(), getInputData().get(), getWidth(), getHeight())) {
        setError(true);
        setErrorMsg("Error while encoding texture data\n");
        return;
      }
    } else {
      setError(true);
      setErrorMsg("Unsupported source format found\n");
    }
  } else {
    setError(true);
    setErrorMsg("Invalid tile data found\n");
  }
}

void TileData::v2toV1() noexcept
{
  if (isValid()) {
    Colors colors(getOptions());
    if (0 == colors.ARGBToPal(getInputData().get(), getOutputData().get(), getPaletteData().get(),
                              getWidth(), getHeight())) {
      setError(true);
      setErrorMsg("Error while converting tile data\n");
    }
  } else {
    setError(true);
    setErrorMsg("Invalid tile data found\n");
  }
}


}   // namespace tc
