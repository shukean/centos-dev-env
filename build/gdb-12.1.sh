#!/bin/bash

#source ./cc.cfg
source ./path.cfg

tar -xf ../gdb-12.1.tar.xz -C ./
cd gdb-12.1

./configure --prefix=$BIN_PATH/gdb --with-python

make -j12 && make install

ln -s $BIN_PATH/gdb/bin/gdb $HOME/.local/bin/gdb
ln -s $BIN_PATH/gdb/bin/gcore $HOME/.local/bin/gcore

ln -s $(dirname $BUILD_PATH)/gdbinit $HOME/.gdbinit
