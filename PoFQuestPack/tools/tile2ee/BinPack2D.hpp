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
#ifndef _BINPACK2D_HPP_
#define _BINPACK2D_HPP_
#include <vector>

namespace tc {

struct Rect;
struct RectSize;

/**
 * Implementation of a two-dimensional rectangle bin packing algorithm.
 * (Adapted version of Jukka Jyl�nki's C++ implementation of RectangleBinPack-&gt;MaxRectsBinPack.)
 */
class BinPack2D
{
public:
  /// Instantiates a bin of size (0,0). Call Init to create a new bin.
  BinPack2D();

  /// Instantiates a bin of the given size.
  BinPack2D(int width, int height);

  /// (Re)initializes the packer to an empty bin of width x height units. Call whenever
  /// you need to restart with a new bin.
  void init(int width, int height);

  /// Specifies the different heuristic rules that can be used when deciding where to place a new rectangle.
  enum HeuristicRules
  {
    BestShortSideFit,   /// BSSF: Positions the rectangle against the short side of a free rectangle into which it fits the best.
    BestLongSideFit,    /// BLSF: Positions the rectangle against the long side of a free rectangle into which it fits the best.
    BestAreaFit,        /// BAF: Positions the rectangle into the smallest free rect into which it fits.
    BottomLeftRule,     /// BL: Does the Tetris placement.
    ContactPointRule    /// CP: Choosest the placement where the rectangle touches other rects as much as possible.
  };

  /// Inserts the given list of rectangles in an offline/batch mode, possibly rotated.
  /// @param rects The list of rectangles to insert. This vector will be destroyed in the process.
  /// @param dst [out] This list will contain the packed rectangles. The indices will not correspond to that of rects.
  /// @param method The rectangle placement rule to use when packing.
  void insert(std::vector<RectSize> &rects, std::vector<Rect> &dst, HeuristicRules method);

  /// Inserts a single rectangle into the bin, possibly rotated.
  Rect insert(int width, int height, HeuristicRules method);

  /// Computes the ratio of used surface area to the total bin area.
  float occupancy() const;

  /** Returns the width of the current bin. */
  int getBinWidth() const noexcept { return m_binWidth; }
  /** Returns the height of the current bin. */
  int getBinHeight() const noexcept { return m_binHeight; }

  /**
   * Attempts to shrink the current bin as much as possible. If "binary" is true, the shrinking
   * process will always try to reduce dimensions by 50% for each iteration.
   */
  void shrinkBin(bool binary) noexcept;

private:
  int m_binWidth;
  int m_binHeight;

  std::vector<Rect> m_usedRectangles;
  std::vector<Rect> m_freeRectangles;

  /// Computes the placement score for placing the given rectangle with the given method.
  /// @param score1 [out] The primary placement score will be outputted here.
  /// @param score2 [out] The secondary placement score will be outputted here. This isu sed to break ties.
  /// @return This struct identifies where the rectangle would be placed if it were placed.
  Rect scoreRect(int width, int height, HeuristicRules method, int &score1, int &score2) const;

  /// Places the given rectangle into the bin.
  void placeRect(const Rect &node);

  /// Computes the placement score for the -CP variant.
  int contactPointScoreNode(int x, int y, int width, int height) const;

  Rect findPositionForNewNodeBottomLeft(int width, int height, int &bestY, int &bestX) const;
  Rect findPositionForNewNodeBestShortSideFit(int width, int height, int &bestShortSideFit, int &bestLongSideFit) const;
  Rect findPositionForNewNodeBestLongSideFit(int width, int height, int &bestShortSideFit, int &bestLongSideFit) const;
  Rect findPositionForNewNodeBestAreaFit(int width, int height, int &bestAreaFit, int &bestShortSideFit) const;
  Rect findPositionForNewNodeContactPoint(int width, int height, int &contactScore) const;

  /// @return True if the free node was split.
  bool splitFreeNode(Rect freeNode, const Rect &usedNode);

  /// Goes through the free rectangle list and removes any redundant entries.
  void pruneFreeList();

  /// Returns true if a is contained in b.
  static bool isContainedIn(const Rect &a, const Rect &b);

  static int commonIntervalLength(int i1start, int i1end, int i2start, int i2end);
};


struct RectSize {
  int width;
  int height;
};

struct Rect {
  int x;
  int y;
  int width;
  int height;
};

}

#endif    // _BINPACK2D_HPP_
