#!/bin/bash

source ./path.cfg

tar -xf ../the_silver_searcher-1.0.0.tar.gz  -C ./
cd the_silver_searcher-1.0.0
./configure --prefix=$BIN_PATH/the_silver_searcher  \
PCRE_LIBS="-lpcre -llzma"  \
CPPFLAGS="-I/usr/include" \
LDFLAGS="-L/usr/lib64" \
PKG_CONFIG="/usr/bin/pkg-config"

make -j12 && make install
