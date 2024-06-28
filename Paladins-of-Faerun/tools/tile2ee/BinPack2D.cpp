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
#include <utility>
#include <iostream>
#include <limits>
#include <cstring>
#include <cmath>
#include "BinPack2D.hpp"

namespace tc {

BinPack2D::BinPack2D()
: m_binWidth(0)
, m_binHeight(0)
{
}

BinPack2D::BinPack2D(int width, int height)
{
  init(width, height);
}

void BinPack2D::init(int width, int height)
{
  m_binWidth = width;
  m_binHeight = height;

  Rect n;
  n.x = 0;
  n.y = 0;
  n.width = width;
  n.height = height;

  m_usedRectangles.clear();

  m_freeRectangles.clear();
  m_freeRectangles.push_back(n);
}

Rect BinPack2D::insert(int width, int height, HeuristicRules method)
{
  Rect newNode;
  int score1;   // Unused in this function. We don't need to know the score after finding the position.
  int score2;
  switch (method)
  {
    case BestShortSideFit:
      newNode = findPositionForNewNodeBestShortSideFit(width, height, score1, score2);
      break;
    case BottomLeftRule:
      newNode = findPositionForNewNodeBottomLeft(width, height, score1, score2);
      break;
    case ContactPointRule:
      newNode = findPositionForNewNodeContactPoint(width, height, score1);
      break;
    case BestLongSideFit:
      newNode = findPositionForNewNodeBestLongSideFit(width, height, score2, score1);
      break;
    case BestAreaFit:
      newNode = findPositionForNewNodeBestAreaFit(width, height, score1, score2);
      break;
  }

  if (newNode.height == 0) {
    return newNode;
  }

  size_t numRectanglesToProcess = m_freeRectangles.size();
  for (size_t i = 0; i < numRectanglesToProcess; ++i) {
    if (splitFreeNode(m_freeRectangles[i], newNode)) {
      m_freeRectangles.erase(m_freeRectangles.begin() + i);
      --i;
      --numRectanglesToProcess;
    }
  }

  pruneFreeList();

  m_usedRectangles.push_back(newNode);
  return newNode;
}

void BinPack2D::insert(std::vector<RectSize> &rects, std::vector<Rect> &dst, HeuristicRules method)
{
  dst.clear();

  while (rects.size() > 0) {
    int bestScore1 = std::numeric_limits<int>::max();
    int bestScore2 = std::numeric_limits<int>::max();
    int bestRectIndex = -1;
    Rect bestNode;

    for (size_t i = 0; i < rects.size(); ++i) {
      int score1;
      int score2;
      Rect newNode = scoreRect(rects[i].width, rects[i].height, method, score1, score2);

      if (score1 < bestScore1 || (score1 == bestScore1 && score2 < bestScore2)) {
        bestScore1 = score1;
        bestScore2 = score2;
        bestNode = newNode;
        bestRectIndex = i;
      }
    }

    if (bestRectIndex == -1) {
      return;
    }

    placeRect(bestNode);
    rects.erase(rects.begin() + bestRectIndex);
  }
}

void BinPack2D::shrinkBin(bool binary) noexcept
{
  if (m_usedRectangles.empty()) {
    return;
  }

  int minX = std::numeric_limits<int>::max();
  int minY = std::numeric_limits<int>::max();
  int maxX = std::numeric_limits<int>::min();
  int maxY = std::numeric_limits<int>::min();

  // finding borders
  for (size_t i = 0; i < m_usedRectangles.size(); i++) {
    Rect &r = m_usedRectangles.at(i);
    minX = std::min(minX, r.x);
    minY = std::min(minY, r.y);
    maxX = std::max(maxX, r.x + r.width);
    maxY = std::max(maxY, r.y + r.height);
  }

  int newWidth = maxX - minX;
  int newHeight = maxY - minY;

  if (binary) {
   int curWidth = getBinWidth();
   int curHeight = getBinHeight();
   while (newWidth <= (curWidth >> 1)) {
     curWidth >>= 1;
   }
   newWidth = curWidth;
   while (newHeight <= (curHeight >> 1)) {
     curHeight >>= 1;
   }
   newHeight = curHeight;
  }

  // adjusting rectangle positions
  if ((newWidth != getBinWidth() || newHeight != getBinHeight()) && (minX > 0 || minY > 0)) {
    auto iterFree = m_freeRectangles.begin();
    auto iterUsed = m_usedRectangles.begin();
    while (iterFree != m_freeRectangles.end() && iterUsed != m_usedRectangles.end()) {
      if (iterFree != m_freeRectangles.end()) {
        iterFree->x -= minX;
        iterFree->y -= minY;
      }
      if (iterUsed != m_usedRectangles.end()) {
        iterUsed->x -= minX;
        iterUsed->y -= minY;
      }
    }
  }

  m_binWidth = newWidth;
  m_binHeight = newHeight;
}

void BinPack2D::placeRect(const Rect &node)
{
  size_t numRectanglesToProcess = m_freeRectangles.size();
  for (size_t i = 0; i < numRectanglesToProcess; ++i) {
    if (splitFreeNode(m_freeRectangles[i], node)) {
      m_freeRectangles.erase(m_freeRectangles.begin() + i);
      --i;
      --numRectanglesToProcess;
    }
  }

  pruneFreeList();

  m_usedRectangles.push_back(node);
  // dst.push_back(bestNode); ///\todo Refactor so that this compiles.
}

Rect BinPack2D::scoreRect(int width, int height, HeuristicRules method, int &score1, int &score2) const
{
  Rect newNode;
  score1 = std::numeric_limits<int>::max();
  score2 = std::numeric_limits<int>::max();
  switch (method)
  {
    case BestShortSideFit:
      newNode = findPositionForNewNodeBestShortSideFit(width, height, score1, score2);
      break;
    case BottomLeftRule:
      newNode = findPositionForNewNodeBottomLeft(width, height, score1, score2);
      break;
    case ContactPointRule:
      newNode = findPositionForNewNodeContactPoint(width, height, score1);
      score1 = -score1; // Reverse since we are minimizing, but for contact point score bigger is better.
      break;
    case BestLongSideFit:
      newNode = findPositionForNewNodeBestLongSideFit(width, height, score2, score1);
      break;
    case BestAreaFit:
      newNode = findPositionForNewNodeBestAreaFit(width, height, score1, score2);
      break;
  }

  // Cannot fit the current rectangle.
  if (newNode.height == 0) {
    score1 = std::numeric_limits<int>::max();
    score2 = std::numeric_limits<int>::max();
  }

  return newNode;
}

/// Computes the ratio of used surface area.
float BinPack2D::occupancy() const
{
  unsigned long usedSurfaceArea = 0;
  for (size_t i = 0; i < m_usedRectangles.size(); ++i)
    usedSurfaceArea += m_usedRectangles[i].width * m_usedRectangles[i].height;

  return (float)usedSurfaceArea / (m_binWidth * m_binHeight);
}

Rect BinPack2D::findPositionForNewNodeBottomLeft(int width, int height, int &bestY, int &bestX) const
{
  Rect bestNode;
  std::memset(&bestNode, 0, sizeof(Rect));

  bestY = std::numeric_limits<int>::max();

  for (size_t i = 0; i < m_freeRectangles.size(); ++i) {
    // Try to place the rectangle in upright (non-flipped) orientation.
    if (m_freeRectangles[i].width >= width && m_freeRectangles[i].height >= height) {
      int topSideY = m_freeRectangles[i].y + height;
      if (topSideY < bestY || (topSideY == bestY && m_freeRectangles[i].x < bestX)) {
        bestNode.x = m_freeRectangles[i].x;
        bestNode.y = m_freeRectangles[i].y;
        bestNode.width = width;
        bestNode.height = height;
        bestY = topSideY;
        bestX = m_freeRectangles[i].x;
      }
    }
  }
  return bestNode;
}

Rect BinPack2D::findPositionForNewNodeBestShortSideFit(int width, int height, int &bestShortSideFit, int &bestLongSideFit) const
{
  Rect bestNode;
  std::memset(&bestNode, 0, sizeof(Rect));

  bestShortSideFit = std::numeric_limits<int>::max();

  for (size_t i = 0; i < m_freeRectangles.size(); ++i) {
    // Try to place the rectangle in upright (non-flipped) orientation.
    if (m_freeRectangles[i].width >= width && m_freeRectangles[i].height >= height) {
      int leftoverHoriz = std::abs(m_freeRectangles[i].width - width);
      int leftoverVert = std::abs(m_freeRectangles[i].height - height);
      int shortSideFit = std::min(leftoverHoriz, leftoverVert);
      int longSideFit = std::max(leftoverHoriz, leftoverVert);

      if (shortSideFit < bestShortSideFit ||
          (shortSideFit == bestShortSideFit && longSideFit < bestLongSideFit)) {
        bestNode.x = m_freeRectangles[i].x;
        bestNode.y = m_freeRectangles[i].y;
        bestNode.width = width;
        bestNode.height = height;
        bestShortSideFit = shortSideFit;
        bestLongSideFit = longSideFit;
      }
    }
  }
  return bestNode;
}

Rect BinPack2D::findPositionForNewNodeBestLongSideFit(int width, int height, int &bestShortSideFit, int &bestLongSideFit) const
{
  Rect bestNode;
  std::memset(&bestNode, 0, sizeof(Rect));

  bestLongSideFit = std::numeric_limits<int>::max();

  for (size_t i = 0; i < m_freeRectangles.size(); ++i) {
    // Try to place the rectangle in upright (non-flipped) orientation.
    if (m_freeRectangles[i].width >= width && m_freeRectangles[i].height >= height) {
      int leftoverHoriz = std::abs(m_freeRectangles[i].width - width);
      int leftoverVert = std::abs(m_freeRectangles[i].height - height);
      int shortSideFit = std::min(leftoverHoriz, leftoverVert);
      int longSideFit = std::max(leftoverHoriz, leftoverVert);

      if (longSideFit < bestLongSideFit ||
          (longSideFit == bestLongSideFit && shortSideFit < bestShortSideFit)) {
        bestNode.x = m_freeRectangles[i].x;
        bestNode.y = m_freeRectangles[i].y;
        bestNode.width = width;
        bestNode.height = height;
        bestShortSideFit = shortSideFit;
        bestLongSideFit = longSideFit;
      }
    }
  }
  return bestNode;
}

Rect BinPack2D::findPositionForNewNodeBestAreaFit(int width, int height, int &bestAreaFit, int &bestShortSideFit) const
{
  Rect bestNode;
  std::memset(&bestNode, 0, sizeof(Rect));

  bestAreaFit = std::numeric_limits<int>::max();

  for (size_t i = 0; i < m_freeRectangles.size(); ++i) {
    int areaFit = m_freeRectangles[i].width * m_freeRectangles[i].height - width * height;

    // Try to place the rectangle in upright (non-flipped) orientation.
    if (m_freeRectangles[i].width >= width && m_freeRectangles[i].height >= height) {
      int leftoverHoriz = std::abs(m_freeRectangles[i].width - width);
      int leftoverVert = std::abs(m_freeRectangles[i].height - height);
      int shortSideFit = std::min(leftoverHoriz, leftoverVert);

      if (areaFit < bestAreaFit ||
          (areaFit == bestAreaFit && shortSideFit < bestShortSideFit)) {
        bestNode.x = m_freeRectangles[i].x;
        bestNode.y = m_freeRectangles[i].y;
        bestNode.width = width;
        bestNode.height = height;
        bestShortSideFit = shortSideFit;
        bestAreaFit = areaFit;
      }
    }
  }
  return bestNode;
}

int BinPack2D::contactPointScoreNode(int x, int y, int width, int height) const
{
  int score = 0;

  if (x == 0 || x + width == m_binWidth) {
    score += height;
  }
  if (y == 0 || y + height == m_binHeight) {
    score += width;
  }

  for (size_t i = 0; i < m_usedRectangles.size(); ++i) {
    if (m_usedRectangles[i].x == x + width || m_usedRectangles[i].x + m_usedRectangles[i].width == x) {
      score += commonIntervalLength(m_usedRectangles[i].y,
                                    m_usedRectangles[i].y + m_usedRectangles[i].height,
                                    y, y + height);
    }
    if (m_usedRectangles[i].y == y + height || m_usedRectangles[i].y + m_usedRectangles[i].height == y) {
      score += commonIntervalLength(m_usedRectangles[i].x,
                                    m_usedRectangles[i].x + m_usedRectangles[i].width,
                                    x, x + width);
    }
  }
  return score;
}

Rect BinPack2D::findPositionForNewNodeContactPoint(int width, int height, int &bestContactScore) const
{
  Rect bestNode;
  std::memset(&bestNode, 0, sizeof(Rect));

  bestContactScore = -1;

  for (size_t i = 0; i < m_freeRectangles.size(); ++i) {
    // Try to place the rectangle in upright (non-flipped) orientation.
    if (m_freeRectangles[i].width >= width && m_freeRectangles[i].height >= height) {
      int score = contactPointScoreNode(m_freeRectangles[i].x, m_freeRectangles[i].y, width, height);
      if (score > bestContactScore) {
        bestNode.x = m_freeRectangles[i].x;
        bestNode.y = m_freeRectangles[i].y;
        bestNode.width = width;
        bestNode.height = height;
        bestContactScore = score;
      }
    }
  }
  return bestNode;
}

bool BinPack2D::splitFreeNode(Rect freeNode, const Rect &usedNode)
{
  // Test with SAT if the rectangles even intersect.
  if (usedNode.x >= freeNode.x + freeNode.width || usedNode.x + usedNode.width <= freeNode.x ||
    usedNode.y >= freeNode.y + freeNode.height || usedNode.y + usedNode.height <= freeNode.y) {
    return false;
  }

  if (usedNode.x < freeNode.x + freeNode.width && usedNode.x + usedNode.width > freeNode.x) {
    // New node at the top side of the used node.
    if (usedNode.y > freeNode.y && usedNode.y < freeNode.y + freeNode.height) {
      Rect newNode = freeNode;
      newNode.height = usedNode.y - newNode.y;
      m_freeRectangles.push_back(newNode);
    }

    // New node at the bottom side of the used node.
    if (usedNode.y + usedNode.height < freeNode.y + freeNode.height) {
      Rect newNode = freeNode;
      newNode.y = usedNode.y + usedNode.height;
      newNode.height = freeNode.y + freeNode.height - (usedNode.y + usedNode.height);
      m_freeRectangles.push_back(newNode);
    }
  }

  if (usedNode.y < freeNode.y + freeNode.height && usedNode.y + usedNode.height > freeNode.y) {
    // New node at the left side of the used node.
    if (usedNode.x > freeNode.x && usedNode.x < freeNode.x + freeNode.width) {
      Rect newNode = freeNode;
      newNode.width = usedNode.x - newNode.x;
      m_freeRectangles.push_back(newNode);
    }

    // New node at the right side of the used node.
    if (usedNode.x + usedNode.width < freeNode.x + freeNode.width) {
      Rect newNode = freeNode;
      newNode.x = usedNode.x + usedNode.width;
      newNode.width = freeNode.x + freeNode.width - (usedNode.x + usedNode.width);
      m_freeRectangles.push_back(newNode);
    }
  }

  return true;
}

void BinPack2D::pruneFreeList()
{
  /*
  ///  Would be nice to do something like this, to avoid a Theta(n^2) loop through each pair.
  ///  But unfortunately it doesn't quite cut it, since we also want to detect containment.
  ///  Perhaps there's another way to do this faster than Theta(n^2).

  if (freeRectangles.size() > 0) {
    clb::sort::QuickSort(&m_freeRectangles[0], m_freeRectangles.size(), NodeSortCmp);
  }

  for (size_t i = 0; i < m_freeRectangles.size()-1; ++i)
    if (m_freeRectangles[i].x == m_freeRectangles[i+1].x &&
        m_freeRectangles[i].y == m_freeRectangles[i+1].y &&
        m_freeRectangles[i].width == m_freeRectangles[i+1].width &&
        m_freeRectangles[i].height == m_freeRectangles[i+1].height) {
      m_freeRectangles.erase(m_freeRectangles.begin() + i);
      --i;
    }
  */

  /// Go through each pair and remove any rectangle that is redundant.
  for (size_t i = 0; i < m_freeRectangles.size(); ++i) {
    for (size_t j = i+1; j < m_freeRectangles.size(); ++j) {
      if (isContainedIn(m_freeRectangles[i], m_freeRectangles[j])) {
        m_freeRectangles.erase(m_freeRectangles.begin()+i);
        --i;
        break;
      }
      if (isContainedIn(m_freeRectangles[j], m_freeRectangles[i])) {
        m_freeRectangles.erase(m_freeRectangles.begin()+j);
        --j;
      }
    }
  }
}

bool BinPack2D::isContainedIn(const Rect &a, const Rect &b)
{
  return a.x >= b.x && a.y >= b.y &&
         a.x+a.width <= b.x+b.width &&
         a.y+a.height <= b.y+b.height;
}

/// Returns 0 if the two intervals i1 and i2 are disjoint, or the length of their overlap otherwise.
int BinPack2D::commonIntervalLength(int i1start, int i1end, int i2start, int i2end)
{
  if (i1end < i2start || i2end < i1start) {
    return 0;
  }
  return std::min(i1end, i2end) - std::max(i1start, i2start);
}

}
