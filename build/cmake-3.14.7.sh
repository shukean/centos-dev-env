#!/bin/bash

#source ./cc.cfg
source ./path.cfg

tar -xf ../cmake-3.14.7.tar.gz -C ./
cd cmake-3.14.7
./bootstrap --prefix=$BIN_PATH/cmake

make -j12 && make install
