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
#ifndef _OPTIONS_HPP_
#define _OPTIONS_HPP_
#include <string>
#include <vector>
#include "Types.hpp"

namespace tc {

/** Handles options parsing and storage. */
class Options
{
public:
  /**
   * Attempts to determine the type of the given file.
   * \param fileName The file to check.
   * \param assumeTis Enable to check for headerless TIS files.
   * \return The detected file type, or FileType::UNKNOWN on error.
   */
  static FileType GetFileType(const std::string &fileName, bool assumeTis) noexcept;

  /**
   * Returns a filename for the output file based on the specified parameters.
   * Appends output file by a number if filename already exists (e.g. foo.bar-0, foo.bar-1, ...).
   * \param path Output path.
   * \param inputFile Input file with path.
   * \return Full path to output filename or empty string on error.
   */
  static std::string GetOutputFileName(const std::string &path, const std::string inputFile,
                                       FileType type, bool overwrite) noexcept;

  /** Returns a PVRZ filename for TIS files, based on the specified parameters. */
  static std::string GenerateTisPvrzName(const std::string &tisName, int index) noexcept;

  /** Returns a PVRZ filename for MOS files, based on the specified parameters. */
  static std::string GenerateMosPvrzName(const std::string &mosName, int index) noexcept;

public:
  Options() noexcept;
  ~Options() noexcept;

  /** Initialize options from the specified arguments. */
  bool init(int argc, char *argv[]) noexcept;

  /** Display a short syntax help. */
  void showHelp() const noexcept;

  /** Methods for managing input files. */
  bool addInput(const std::string &inFile) noexcept;
  void removeInput(int idx) noexcept;
  void clearInput() noexcept { m_inFiles.clear(); }
  int getInputCount() const noexcept { return m_inFiles.size(); }
  const std::string& getInput(int idx) const noexcept;

  /** Methods for managing search paths. */
  bool addSearchPath(const std::string &path) noexcept;
  void removeSearchPath(int idx) noexcept;
  void clearSearchPaths() noexcept { m_searchPaths.clear(); }
  int getSearchPathCount() const noexcept { return m_searchPaths.size(); }
  std::string getSearchPath(int idx) const noexcept;
  /** Returns the specified file with full path if it exists in any of the search paths. */
  std::string searchFile(const std::string &fileName) const noexcept;
  /** Returns the specified file with full path if it exists in the specified path or any of the search paths. */
  std::string searchFile(const std::string &fileName, const std::string &path) const noexcept;

  /** Get/set start index for PVRZ files of MOS V2. */
  int getMosIndex() const noexcept { return m_mosIndex; }
  void setMosIndex(int index) noexcept;

  /** Get/set start page for PVRZ files of TIS V2. */
  int getTisPage() const noexcept { return m_tisPage; }
  void setTisPage(int page) noexcept;

  /** Inditates whether to overwrite PVRZ files (MOS only). */
  bool isOverwritePvrz() const noexcept { return m_overwritePvrz; }
  void setOverwritePvrz(bool b) noexcept { m_overwritePvrz = b; }

  /** Get/set whether to limit conversion to a specific format. */
  int getConversionType() const noexcept { return m_conversionType; }
  void setConversionType(int type) noexcept;

  /** Define output file name or path. */
  bool setOutput(const std::string &outFile) noexcept;
  bool isOutPath() const noexcept { return !m_outPath.empty(); }
  bool isOutFile() const noexcept { return !m_outFile.empty(); }
  const std::string& getOutFile() const noexcept { return m_outFile; }
  const std::string& getOutPath() const noexcept { return m_outPath; }

  /** Cancel operation on error? Only effective when processing multiple files. */
  void setHaltOnError(bool b) noexcept { m_haltOnError = b; }
  bool isHaltOnError() const noexcept { return m_haltOnError; }

  /** Controls visual feedback. */
  void setSilent(bool b) noexcept { m_isSilent = b; }
  bool isSilent() const noexcept { return m_isSilent; }

  /** Create MOSC files (MOSV2->MOSV1 conversion only)? */
  void setMosc(bool b) noexcept { m_mosc = b; }
  bool isMosc() const noexcept { return m_mosc; }

  /** Encoding and decoding quality. Range: [0..9] each. */
  void setQuality(int v1, int v2) noexcept;
  void setQualityV1(int v) noexcept;
  void setQualityV2(int v) noexcept;
  int getQualityV1() const noexcept { return m_qualityV1; }
  int getQualityV2() const noexcept { return m_qualityV2; }

  /** Set number of threads to use for encoding/decoding. (0=autodetect) */
  void setThreads(int v) noexcept;
  /** Return number of threads to use for encoding/decoding. */
  int getThreads() const noexcept;
  /**
   * Return number of threads to use for encoding/decoding.
   * \param evaluateAuto If true, returns actual number of threads. If false, returns 0 for autodetect.
   */
  int getThreads(bool evaluateAuto) const noexcept;

  /** Show statistics about the specified input file(s) only. */
  void setShowInfo(bool b) noexcept { m_showInfo = b; }
  bool isShowInfo() const noexcept { return m_showInfo; }

  /** Treat unknown input files as headerless TIS files. */
  void setAssumeTis(bool b) noexcept { m_assumeTis = b; }
  bool assumeTis() const noexcept { return m_assumeTis; }

  /**
   * Returns a string containing a list of options in textual form.
   * \param complete If false, only options differing from the defaults are listed,
   *                 if true, all options are listed.
   * \return The list of options as text
   */
  std::string getOptionsSummary(bool complete) const noexcept;

public:
  // Verbosity levels
  static const int          VERBOSITY_SILENT;
  static const int          VERBOSITY_DEFAULT;
  static const int          VERBOSITY_VERBOSE;

private:
  static const int          MAX_THREADS;        // max. number of threads

  // default values for options
  static const bool         DEF_SILENT;
  static const bool         DEF_HALT_ON_ERROR;
  static const bool         DEF_MOSC;
  static const bool         DEF_SHOWINFO;
  static const bool         DEF_ASSUMETIS;
  static const bool         DEF_OVERWRITE_PVRZ;
  static const int          DEF_VERBOSITY;
  static const int          DEF_QUALITY_V1;
  static const int          DEF_QUALITY_V2;
  static const int          DEF_THREADS;
  static const int          DEF_MOS_INDEX;
  static const int          DEF_TIS_PAGE;
  static const int          DEF_CONVERSION_TYPE;

  static const char         ParamNames[];

  bool                      m_isSilent;       // Indicates whether to show visual feedback
  bool                      m_haltOnError;    // Cancel operation on error
  bool                      m_mosc;           // Create MOSC output
  bool                      m_showInfo;
  bool                      m_assumeTis;      // Treat unknown file types as headerless TIS files
  bool                      m_overwritePvrz;  // Overwrite existing PVRZ files (MOS only)
  int                       m_qualityV1;      // color reduction quality (0:fast, 9:slow)
  int                       m_qualityV2;      // DXTn compression quality (0:fast, 9:slow)
  int                       m_threads;        // how many threads to use for encoding/decoding
  int                       m_mosIndex;       // Start index of PVRZ files for MOS V2
  int                       m_tisPage;        // Start page of PVRZ files for TIS V2
  int                       m_conversionType; // Type of conversion (auto=0, V1=1 or V2=2)
  std::vector<std::string>  m_inFiles;
  std::vector<std::string>  m_searchPaths;    // list of search paths for WEDs and PVRZs
  std::string               m_outPath;        // file path (empty or with trailing path separator) only!
  std::string               m_outFile;        // file name only!
};

}   // namespace tc

#endif		// _OPTIONS_HPP_
