#!/bin/bash

source ./cc.cfg

tar -xf ../Python-3.8.11.tar.xz -C ./

cd Python-3.8.11

./configure --prefix=$BIN_PATH/python \
--enable-optimizations  \
--enable-shared     \
CPPFLAGS="$CPPFLAGS -I$LIB_PATH/ffi-3.4.2/include -I$LIB_PATH/bzip2-1.0.8/include" \
LDFLAGS="$LDFLAGS -Wl,-R$BIN_PATH/python/lib -Wl,-R$LIB_PATH/ffi-3.4.2/lib -Wl,-R$LIB_PATH/bzip2-1.0.8/lib -L$LIB_PATH/ffi-3.4.2/lib -L$LIB_PATH/bzip2-1.0.8/lib" \
LIBS="-lffi -lbz2"

make -j12 && make install
