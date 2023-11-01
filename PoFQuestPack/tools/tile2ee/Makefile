########################
# Makefile for tile2ee #
########################

include config.mk

CXX           ?= g++
CXXFLAGS      = -c -Wall -O2 -std=c++11 -msse -mfpmath=sse -I$(ZLIB_INCLUDE) -I$(PNGQUANT_INCLUDE) -I$(SQUISH_INCLUDE)
LDFLAGS       = -L$(ZLIB_LIB) -L$(PNGQUANT_LIB) -L$(SQUISH_LIB)
LIBS          = -lz -limagequant -lsquish
EXECUTABLE    = tile2ee

ifeq ($(OS),Windows_NT)
  EXT         = .exe
  RM          = del
  LDFLAGS     += -static
  ifeq ($(USE_WINTHREADS),1)
    CXXFLAGS    += -mwindows -DUSE_WINTHREADS=1
  else
    LIBS        += -pthread
  endif
else
  RM          = rm
  LIBS        += -pthread
  ifeq ($(shell uname -s),Darwin)
    # A few hacks to enable proper threading support
    CXXFLAGS    += -D_GLIBCXX_USE_NANOSLEEP
    # Don't assume that standard libraries are available on the target system
    LDFLAGS     += -static-libstdc++ -static-libgcc
  else
    # Nothing to do for Linux (yet)
  endif
endif

SOURCES = \
  BinPack2D.cpp \
  ColorQuant.cpp \
  Colors.cpp \
  Compression.cpp \
  Converter.cpp \
  ConverterDxt.cpp \
  File.cpp \
  Graphics.cpp \
  Options.cpp \
  Texture.cpp \
  Tile2EE.cpp \
  TileData.cpp \
  TileThreadPoolBase.cpp \
  TileThreadPoolPosix.cpp \
  TileThreadPoolWin32.cpp \
  Version.cpp

OBJECTS = $(SOURCES:.cpp=.o)


all: $(SOURCES) $(EXECUTABLE)

install: $(EXECUTABLE)$(EXT)
ifeq ($(OS),Windows_NT)
	@echo Target not supported.
else
	install $(EXECUTABLE) $(INSTALL_DIR)/$(EXECUTABLE)
endif

uninstall:
ifeq ($(OS),Windows_NT)
	@echo Target not supported.
else
	$(RM) $(INSTALL_DIR)/$(EXECUTABLE)
endif

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(LDFLAGS) $(OBJECTS) $(LIBS) -o $@

.cpp.o:
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $< -o $@

clean:
	$(RM) $(OBJECTS)
