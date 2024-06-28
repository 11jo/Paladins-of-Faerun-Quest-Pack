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
#include <unistd.h>
#include <algorithm>
#include "File.hpp"
#include "TileThreadPool.hpp"
#include "Funcs.hpp"
#include "Version.hpp"
#include "Options.hpp"

namespace tc {

const int Options::MAX_THREADS          = 64;

const bool Options::DEF_SILENT          = false;
const bool Options::DEF_HALT_ON_ERROR   = true;
const bool Options::DEF_MOSC            = false;
const bool Options::DEF_SHOWINFO        = false;
const bool Options::DEF_ASSUMETIS       = false;
const bool Options::DEF_OVERWRITE_PVRZ  = false;
const int Options::DEF_QUALITY_V1       = 4;
const int Options::DEF_QUALITY_V2       = 9;
const int Options::DEF_THREADS          = 0;
const int Options::DEF_MOS_INDEX        = 1000;
const int Options::DEF_TIS_PAGE         = 0;
const int Options::DEF_CONVERSION_TYPE  = 0;

// Supported parameter names
const char Options::ParamNames[] = "esd:o:i:p:f:wzj:q:TIV";

Options::Options() noexcept
: m_isSilent(DEF_SILENT)
, m_haltOnError(DEF_HALT_ON_ERROR)
, m_mosc(DEF_MOSC)
, m_showInfo(DEF_SHOWINFO)
, m_assumeTis(DEF_ASSUMETIS)
, m_overwritePvrz(DEF_OVERWRITE_PVRZ)
, m_qualityV1(DEF_QUALITY_V1)
, m_qualityV2(DEF_QUALITY_V2)
, m_threads(DEF_THREADS)
, m_mosIndex(DEF_MOS_INDEX)
, m_tisPage(DEF_TIS_PAGE)
, m_conversionType(DEF_CONVERSION_TYPE)
, m_inFiles()
, m_searchPaths()
, m_outPath()
, m_outFile()
{
}

Options::~Options() noexcept
{
  m_inFiles.clear();
  m_searchPaths.clear();
}


bool Options::init(int argc, char *argv[]) noexcept
{
  if (argc <= 1) {
    showHelp();
    return false;
  }

  int c = 0;
  opterr = 0;
  while ((c = getopt(argc, argv, ParamNames)) != -1) {
    switch (c) {
      case 'e':
        setHaltOnError(false);
        break;
      case 's':
        setSilent(true);
        break;
      case 'd':
        if (optarg != nullptr) {
          std::string path(optarg);
          if (!addSearchPath(path)) {
            std::printf("Warning: Search path does not exist: %s\n", path.c_str());
          }
        } else {
          std::printf("Missing search path for -d\n");
          showHelp();
          return false;
        }
        break;
      case 'o':
        if (optarg != nullptr) {
          setOutput(std::string(optarg));
        } else {
          std::printf("Missing output file or folder for -o\n");
          showHelp();
          return false;
        }
        break;
      case 'i':
        if (optarg != nullptr) {
          int idx = std::atoi(optarg);
          if (idx < 0 || idx > 99999) {
            std::printf("Start index out of range for -i: %d\n", idx);
            showHelp();
            return false;
          }
          setMosIndex(idx);
        } else {
          std::printf("Missing index value for -i\n");
          showHelp();
          return false;
        }
        break;
      case 'p':
        if (optarg != nullptr) {
          int idx = std::atoi(optarg);
          if (idx < 0 || idx > 99) {
            std::printf("PVRZ page is out of range for -p: %d\n", idx);
            showHelp();
            return false;
          }
          setTisPage(idx);
        } else {
          std::printf("Missing page value for -p\n");
          showHelp();
          return false;
        }
        break;
      case 'f':
        if (optarg != nullptr) {
          int ver = std::atoi(optarg);
          if (ver < 0 || ver > 2) {
            std::printf("Invalid type specified for -f\n");
            showHelp();
            return false;
          }
          setConversionType(ver);
        } else {
          std::printf("Missing type value for -f\n");
          showHelp();
          return false;
        }
      case 'w':
        setOverwritePvrz(true);
        break;
      case 'z':
        setMosc(true);
        break;
      case 'j':
        if (optarg != nullptr) {
          int jobs = std::atoi(optarg);
          if (jobs < 0 || jobs > MAX_THREADS) {
            std::printf("Warning: Number of parallel jobs out of range: %d. Using default value.\n", jobs);
            jobs = 0;
          }
          setThreads(jobs);
        } else {
          showHelp();
          return false;
        }
        break;
      case 'q':
        if (optarg != nullptr) {
          int levelV1 = DEF_QUALITY_V1;
          int levelV2 = DEF_QUALITY_V2;
          if (optarg[0] >= '0' && optarg[0] <= '9') {
            levelV1 = optarg[0] - '0';
          } else if (optarg[0] != '-') {
            std::printf("Error: Unrecognized quality level or placeholder for MOS/TIS V1.\n");
            showHelp();
            return false;
          }
          if (optarg[1] >= '0' && optarg[1] <= '9') {
            levelV2 = optarg[1] - '0';
          } else if (optarg[1] != '-' && optarg[1] != 0) {
            std::printf("Error: Unrecognized quality level or placeholder for MOS/TIS V2.\n");
            showHelp();
            return false;
          }
          setQuality(levelV1, levelV2);
        } else {
          showHelp();
          return false;
        }
        break;
      case 'T':
        setAssumeTis(true);
        break;
      case 'I':
        setShowInfo(true);
        break;
      case 'V':
        if (std::strlen(vers_suffix)) {
          std::printf("%s %d.%d.%d (%s) by %s\n", prog_name, vers_major, vers_minor, vers_patch, vers_suffix, author);
        } else {
          if (vers_patch != 0) {
            std::printf("%s %d.%d.%d by %s\n", prog_name, vers_major, vers_minor, vers_patch, author);
          } else {
            std::printf("%s %d.%d by %s\n", prog_name, vers_major, vers_minor, author);
          }
        }
        return false;
      default:
        std::printf("Unrecognized parameter \"-%c\"\n", optopt);
        showHelp();
        return false;
    }
  }

  // remaining arguments are assumed to be input files
  for (; optind < argc; optind++) {
    if (argv[optind][0] == '-') {
      showHelp();
      return false;
    } else if (!addInput(std::string(argv[optind]))) {
      std::printf("Error opening file: %s\n", argv[optind]);
      return false;
    }
  }

  // checking special conditions
  if (getInputCount() == 0) {
    std::printf("No input filename specified\n");
    showHelp();
    return false;
  } else if (getInputCount() > 1 && isOutFile()) {
    std::printf("You cannot specify output file with multiple input files\n");
    showHelp();
    return false;
  }

  return true;
}

void Options::showHelp() const noexcept
{
  std::printf("\nUsage: %s [options] infile [infile2 [...]]\n", prog_name);
  std::printf("\nOptions:\n");
  std::printf("  -e            Do not halt on errors.\n");
  std::printf("  -s            Be silent.\n");
  std::printf("  -d searchdir  Look for referenced PVRZ files in this directory.\n");
  std::printf("                You can specify this option multiple times to add more\n");
  std::printf("                search directories. (Default: Same directory as input file)\n");
  std::printf("  -o output     Select output file or folder.\n");
  std::printf("                (Note: Output file works only with single input file!)\n");
  std::printf("  -i index      (MOS only) Start index for PVRZ files. (Default: 1000)\n");
  std::printf("                (Note: Existing PVRZ files will be detected and skipped\n");
  std::printf("                       unless option -w has been specified.)\n");
  std::printf("  -p page       (TIS only) Starting page number for PVRZ files. (Default: 0)\n");
  std::printf("                (Caution: Total range of this value is limited to 0..99!)\n");
  std::printf("  -f type       Force type of file conversion. Skips files that are already\n");
  std::printf("                in the desired target format.\n");
  std::printf("                Supported values:\n");
  std::printf("                    0: Don't force conversion (default)\n");
  std::printf("                    1: Convert to palette-based MOS/TIS only\n");
  std::printf("                    2: Convert to pvrz-based MOS/TIS only\n");
  std::printf("  -w            (MOS only) Force overwriting of existing PVRZ files.\n");
  std::printf("  -z            (MOS only) Create compressed MOS V1 files (MOSC).\n");
  std::printf("  -j num        Number of parallel threads to speed up the conversion process.\n");
  std::printf("                Valid numbers: 0 (autodetect), 1..256 (Default: 0)\n");
  std::printf("  -q V1[V2]     Set quality levels for encoding V1 and, optionally, V2 files.\n");
  std::printf("                Use '-' as placeholder for default levels.\n");
  std::printf("                Example 1: -q 27 (level 2 for V1 and level 7 for V2)\n");
  std::printf("                Example 2: -q -7 (default level for V1 and level 7 for V2)\n");
  std::printf("                Example 3: -q 2  (level 2 for V1 and default level for V2)\n");
  std::printf("                When creating palette-based MOS/TIS V1 files (Default: 4):\n");
  std::printf("                    Dithering:               levels 5 to 9\n");
  std::printf("                    Posterization:           levels 0 to 2\n");
  std::printf("                    Additional techniques:   levels 4 to 9\n");
  std::printf("                When creating PVRZ-based MOS/TIS V2 files (Default: 9):\n");
  std::printf("                    Iterative cluster fit:   levels 7 to 9\n");
  std::printf("                    Single cluster fit:      levels 3 to 6\n");
  std::printf("                    Range fit:               levels 0 to 2\n");
  std::printf("                    Weight color by alpha:   levels 5 to 9\n");
  std::printf("  -T            (TIS only) Treat unrecognized input files as headerless TIS.\n");
  std::printf("  -I            Show file information and exit.\n");
  std::printf("  -V            Print version number and exit.\n");
  std::printf("\n");
  std::printf("Supported input file types: MOS V1, MOS V2, TIS V1, TIS V2.\n");
  std::printf("Note: You can mix and match input files of each supported type.\n");
}

bool Options::addInput(const std::string &inFile) noexcept
{
  if (!inFile.empty()) {
    m_inFiles.emplace_back(std::string(inFile));
    return true;
  }
  return false;
}

void Options::removeInput(int idx) noexcept
{
  if (idx >= 0 && (size_t)idx < m_inFiles.size()) {
    m_inFiles.erase(m_inFiles.begin() + idx);
  }
}

const std::string& Options::getInput(int idx) const noexcept
{
  static const std::string defString;   // empty default string

  if (idx >= 0 && (size_t)idx < m_inFiles.size()) {
    return *(m_inFiles.begin() + idx);
  }
  return defString;
}

bool Options::addSearchPath(const std::string &path) noexcept
{
  std::string search;

  if (!path.empty()) {
    search.assign(path);

    // removing trailing path separators
    while (!search.empty() && (File::IsPathSeparator(search.at(search.length() - 1)))) {
      search.erase(search.end() - 1);
    }

    if (File::IsDirectory(search.c_str())) {
      for (auto iter = m_searchPaths.cbegin(); iter != m_searchPaths.cend(); ++iter) {
        if (search.compare(*iter) == 0) {
          return true;
        }
      }
      m_searchPaths.push_back(search);
      return true;
    }
  }
  return false;
}

void Options::removeSearchPath(int idx) noexcept
{
  if (idx >= 0 && (size_t)idx < m_searchPaths.size()) {
    m_searchPaths.erase(m_searchPaths.begin() + idx);
  }
}

std::string Options::getSearchPath(int idx) const noexcept
{
  static const std::string defString;   // empty default string

  if (idx >= 0 && (size_t)idx < m_searchPaths.size()) {
    return *(m_searchPaths.begin() + idx);
  }
  return defString;
}

std::string Options::searchFile(const std::string &fileName) const noexcept
{
  return searchFile(fileName, std::string());
}

std::string Options::searchFile(const std::string &fileName, const std:: string &path) const noexcept
{
  if (!fileName.empty()) {
    std::string file = File::ExtractFileName(fileName);
    if (!file.empty()) {
      // use search paths first
      for (int i = 0; i < getSearchPathCount(); i++) {
        std::string tmpFile = File::CreateFileName(getSearchPath(i), file);
        if (File::Exists(tmpFile.c_str()) && !File::IsDirectory(tmpFile.c_str())) {
          return tmpFile;
        }
      }

      // search in input file path last
      std::string tmpFile = File::CreateFileName(path, file);
      if (File::Exists(tmpFile.c_str()) && !File::IsDirectory(tmpFile.c_str())) {
        return tmpFile;
      }
    }
  }
  return std::string();
}

void Options::setMosIndex(int index) noexcept
{
  if (index >= 0 && index <= 99999) {
    m_mosIndex = index;
  }
}

void Options::setTisPage(int page) noexcept
{
  if (page >= 0 && page <= 99) {
    m_tisPage = page;
  }
}

void Options::setConversionType(int type) noexcept
{
  if (type < 0) type = 0;
  if (type > 2) type = 2;
  m_conversionType = type;
}

bool Options::setOutput(const std::string &outFile) noexcept
{
  if (!outFile.empty()) {
    if (File::IsDirectory(outFile.c_str())) {
      m_outPath.assign(outFile);
      m_outFile.clear();
    } else {
      m_outPath.assign(File::ExtractFilePath(outFile));
      m_outFile.assign(File::ExtractFileName(outFile));
    }
    return true;
  }
  return false;
}

void Options::setQuality(int v1, int v2) noexcept
{
  setQualityV1(v1);
  setQualityV2(v2);
}

void Options::setQualityV1(int v) noexcept
{
  m_qualityV1 = std::max(0, std::min(9, v));
}

void Options::setQualityV2(int v) noexcept
{
  m_qualityV2 = std::max(0, std::min(9, v));
}

void Options::setThreads(int v) noexcept
{
  // limiting threads to a sane number
  m_threads = std::max(0, std::min((int)TileThreadPool::MAX_THREADS, v));
}

int Options::getThreads() const noexcept
{
  return getThreads(true);
}

int Options::getThreads(bool evaluateAuto) const noexcept
{
  if (evaluateAuto) {
    return m_threads ? m_threads : getThreadPoolAutoThreads();
  } else {
    return m_threads;
  }
}

std::string Options::getOptionsSummary(bool complete) const noexcept
{
  std::string sum;

  if (complete || isHaltOnError() != DEF_HALT_ON_ERROR) {
    if (!sum.empty()) sum += ", ";
    sum += "halt on errors = ";
    sum += isHaltOnError() ? "enabled" : "disabled";
  }

  if (getConversionType() != DEF_CONVERSION_TYPE) {
    std::string msg;
    switch (getConversionType()) {
      case 1: msg = "convert to V1 only"; break;
      case 2: msg = "convert to V2 only"; break;
    }
    if (!msg.empty()) {
      if (!sum.empty()) sum += ", ";
      sum += msg;
    }
  }

  if (complete || getQualityV1() != DEF_QUALITY_V1) {
    if (!sum.empty()) sum += ", ";
    sum += "TIS/MOS V1 quality = " + std::to_string(getQualityV1());
  }

  if (complete || getQualityV2() != DEF_QUALITY_V2) {
    if (!sum.empty()) sum += ", ";
    sum += "TIS/MOS V2 quality = " + std::to_string(getQualityV2());
  }

  if (complete || isMosc() != DEF_MOSC) {
    if (!sum.empty()) sum += ", ";
    if (isMosc()) sum += "generate MOSC";
    else sum += "generate MOS";
  }

  if (complete || assumeTis() != DEF_ASSUMETIS) {
    if (!sum.empty()) sum += ", ";
    if (assumeTis()) sum += "headerless TIS allowed";
    else sum += "headerless TIS not allowed";
  }

  if (complete || getMosIndex() != DEF_MOS_INDEX) {
    if (!sum.empty()) sum += ", ";
    sum += "PVRZ start index = " + std::to_string(getMosIndex());
  }

  if (complete || getThreads(false) != DEF_THREADS) {
    if (!sum.empty()) sum += ", ";
    sum += "threads = ";
    if (getThreads(false) == 0) {
      sum += "autodetected (" + std::to_string(getThreadPoolAutoThreads()) + ")";
    } else {
      sum += std::to_string(getThreads());
    }
  }

  return sum;
}


// ----------------------- STATIC METHODS -----------------------


FileType Options::GetFileType(const std::string &fileName, bool assumeTis) noexcept
{
  if (!fileName.empty()) {
    File f(fileName.c_str(), "rb");
    if (f.error()) {
      return FileType::UNKNOWN;
    }

    char sig[4];
    if (f.read(sig, 1, 4) != 4) {
      return FileType::UNKNOWN;
    }

    FileType retVal = FileType::UNKNOWN;
    if (std::strncmp(sig, "TIS ", 4) == 0) {
      char ver[4];
      if (f.read(ver, 1, 4) != 4) {
        return FileType::UNKNOWN;
      }
      uint32_t size;
      if (!f.seek(12L, SEEK_SET) || f.read(&size, 1, 4) != 4) {
        return FileType::UNKNOWN;
      }
      size = get32u_le(&size);
      if (size == 0x1400) {
        retVal = FileType::TISV1;
      } else if (size == 12) {
        retVal = FileType::TISV2;
      }
    } else if (std::strncmp(sig, "MOS ", 4) == 0) {
      char ver[4];
      if (f.read(ver, 1, 4) != 4) {
        return FileType::UNKNOWN;
      }
      if (std::strncmp(ver, "V1  ", 4) == 0) {
        retVal = FileType::MOSV1;
      } else if (std::strncmp(ver, "V2  ", 4) == 0) {
        retVal = FileType::MOSV2;
      }
    } else if (std::strncmp(sig, "MOSC", 4) == 0) {
      retVal = FileType::MOSV1;
    } else {
      if (assumeTis) {
        long size = f.getsize();
        if ((size % 0x1400) == 0) {
          retVal = FileType::TISV1;
        } else if ((size % 0x000c) == 0) {
          retVal = FileType::TISV2;
        }
      }
    }

    return retVal;
  }
  return FileType::UNKNOWN;
}

std::string Options::GetOutputFileName(const std::string &path, const std::string inputFile,
                                       FileType type, bool overwrite) noexcept
{
  static const std::string defString;   // empty default string

  if (!inputFile.empty() && type != FileType::UNKNOWN) {
    std::string outFileBase, outFileExt, outPath;

    // getting path
    if (path.empty()) {
      // using input file and path
      outPath = File::ExtractFilePath(inputFile);
    } else {
      // using separate path with input file
      outPath = path;
    }

    // getting filename
    outFileBase = File::ExtractFileBase(inputFile);
    outFileExt = File::ExtractFileExt(inputFile);

    // making output file unique if necessary
    return File::CreateFileName(outPath, outFileBase + outFileExt);
  }
  return defString;
}

std::string Options::GenerateTisPvrzName(const std::string &tisName, int index) noexcept
{
  std::string retVal;
  if (!tisName.empty() && index >= 0 && index < 100) {
    std::string path = File::ExtractFilePath(tisName);
    std::string fileBase = File::ExtractFileBase(tisName);
    if (!fileBase.empty()) {
      retVal = fileBase.at(0);
      if (fileBase.length() > 2) {
        retVal += fileBase.substr(2);
      }
      if (index < 10) {
        retVal += "0";
      }
      retVal = File::CreateFileName(path, retVal + std::to_string(index) + ".pvrz");
    }
  }
  return retVal;
}

std::string Options::GenerateMosPvrzName(const std::string &mosName, int index) noexcept
{
  std::string retVal;
  if (!mosName.empty() && index >= 0 && index <= 99999) {
    std::string path = File::ExtractFilePath(mosName);
    std::string fileBase = "mos";
    if (index < 10) {
      fileBase += "000";
    } else if (index < 100) {
      fileBase += "00";
    } else if (index < 1000) {
      fileBase += "0";
    }
    fileBase += std::to_string(index);
    retVal = File::CreateFileName(path, retVal + fileBase + ".pvrz");
  }
  return retVal;
}

}   // namespace tc
