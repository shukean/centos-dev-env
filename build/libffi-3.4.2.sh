#!/bin/bash


source ./cc.cfg

tar -xf ../libffi-3.4.2.tar.gz -C ./
cd libffi-3.4.2
./configure \
    --prefix="$LOCAL_PATH/lib/ffi-3.4.2"   \
    
make -j12 && make install

