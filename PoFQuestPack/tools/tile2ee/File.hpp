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
#ifndef _FILE_HPP_
#define _FILE_HPP_

#include <cstdio>
#include <string>

namespace tc {

/**
 * A simple wrapper around C-style I/O routines.
 */
class File
{
public:
  /** Extracts the full path component of the given file name. */
  static std::string ExtractFilePath(const std::string &fileName) noexcept;
  /** Extracts the top-level path component of the given file name which can be filename or folder. */
  static std::string ExtractFileName(const std::string &fileName) noexcept;
  /** Extracts the top-level path component without extension. */
  static std::string ExtractFileBase(const std::string &fileName) noexcept;
  /** Extracts the file extension of the top-level path component. */
  static std::string ExtractFileExt(const std::string &fileName) noexcept;

  /** Concatenates path and file and returns the result. */
  static std::string CreateFileName(const std::string &path, const std::string &file) noexcept;

  /** Changes the file extension of the specified filename. */
  static std::string ChangeFileExt(const std::string &fileName, const std::string &fileExt) noexcept;

  /** Returns true if the specified character is a path separator. */
  static bool IsPathSeparator(char ch) noexcept;

  /** Returns true only if the given path is a directory. */
  static bool IsDirectory(const std::string &fileName) noexcept;

  /**
   * Returns true only if the given path exists (can be regular file, folder
   * or any other kind of file type).
   */
  static bool Exists(const std::string &path) noexcept;

  /** Returns size of the given file in bytes. Returns -1 on error. */
  static long GetFileSize(const std::string &fileName) noexcept;

  /** Deletes the file identified by the given name. */
  static bool RemoveFile(const std::string &fileName) noexcept;

  /** Changes the name of a file. */
  static bool RenameFile(const std::string &oldFileName, const std::string &newFileName) noexcept;

  /** Returns whether the two specified path strings are pointing to the same file. */
  static bool IsEqual(const std::string &path1, const std::string &path2) noexcept;

public:
  /** Opens a file in the specified mode. */
  File(const char *fileName, const char *mode) noexcept;
  /** Opens a file in the specified mode, using a custom buffer of given size. */
  File(const char *fileName, const char *mode, int bufferSize) noexcept;

  /** Closes the current file. */
  ~File() noexcept;

  /** Returns the file handle. */
  std::FILE* getHandle() const noexcept { return m_file; }

  /** Returns the currently used file mode. */
  const char* getMode() const noexcept { return m_mode.c_str(); }

  /** Reassigns the current file handle with a new filename. */
  bool reopen(const char *fileName, const char *mode) noexcept;

  /** Flushes any buffered content to the file. */
  bool flush() noexcept;

  /** Reads up to count objects of specified size into an array buffer. Returns number of objects read successfully. */
  std::size_t read(void *buffer, std::size_t size, std::size_t count) noexcept;

  /** Writes up to count objects of specified size from the given array buffer. Returns number of objects written successfully. */
  std::size_t write(const void *buffer, std::size_t size, std::size_t count) noexcept;

  /** Reads the next character from the current file. Returns the character on success and EOF on failure. */
  int getc() noexcept;

  /** Reads at most count - 1 characters from the current file and stores them in str. str is always null-terminated. Returns str on success, NULL on failure. */
  char* gets(char *str, int count) noexcept;

  /** Writes the specified character to the current file. Returns the written character on success and EOF on failure. */
  int putc(int ch) noexcept;

  /** Writes the given null-terminated string to the current file. Returns non-negative value on success and EOF on failure. */
  int puts(const char *str) noexcept;

  /** Puts the character back to the current file. Returns ch on success and EOF on failure. */
  int ungetc(int ch) noexcept;

  /** Returns the current file position or -1L on failure. */
  long tell() noexcept;

  /** Obtains the file position indicator and the current parsing state in pos. Returns true on success and false otherwise. */
  bool getpos(std::fpos_t *pos) noexcept;

  /** Sets the file position for the current file.
   * \param offset number of characters to shift the position from the origin.
   * \param origin One of the following: SEEK_SET, SEEK_CUR or SEEK_END.
   * \return true on success and false otherwise.
   */
  bool seek(long offset, int origin) noexcept;

  /** Sets the file position indicator and the multibyte parsing state for the current file. Returns true on success and false otherwise. */
  bool setpos(const std::fpos_t *pos) noexcept;

  /** Moves the file position indicator to the beginning of the current file. */
  void rewind() noexcept;

  /** Resets the error flags and EOF indicator for the current file. */
  void clearerr() noexcept;

  /** Checks if the end of the current file has been reached. */
  bool eof() noexcept;

  /** Returns true if an error occured during the last I/O operation, false otherwise. */
  bool error() noexcept;

  /** Prints s and a textual description of the error code stored in the system variable errno to stderr. */
  void perror(const char *s) noexcept;

  /** Returns the size of the currently open file. Returns -1 on error. */
  long getsize() noexcept;

  /**
   * Specify whether to remove the file from disk after closing. Default: disabled.
   * (Possible use case: enable on conversion error)
   */
  void setDeleteOnClose(bool b) noexcept { m_deleteOnClose = b; }
  bool isDeleteOnClose() const noexcept { return m_deleteOnClose; }

  /** Returns whether current file is readable. */
  bool isReadEnabled() const noexcept;
  /** Returns whether current file is writable. */
  bool isWriteEnabled() const noexcept;

private:
  /** Not copyable. */
  File(const File &) = delete;

  /** Not assignable. */
  File& operator=(const File &) = delete;

private:
  static const char   PATH_SEPARATOR; // OS-specific path separator character (either '\' or '/')

  std::FILE     *m_file;          // current file handle
  std::string   m_fileName;       // filename
  std::string   m_mode;           // current file mode
  char          *m_buffer;        // internal buffer (if used)
  bool          m_deleteOnClose;
};

}   // namespace tc

#endif  // _FILE_HPP_
