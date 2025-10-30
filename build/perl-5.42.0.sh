#!/bin/bash

source ./cc.cfg

tar -xf ../perl-5.42.0.tar.gz -C ./

cd perl-5.42.0

./Configure -des -Dprefix=$BIN_PATH/perl

make -j8 && make install
