#!/bin/bash

source ./cc.cfg

tar -xf ../fzf-0.56.3.tar.gz -C $BIN_PATH
mv $BIN_PATH/fzf-0.56.3 $BIN_PATH/fzf
tar -xf ../fzf-0.56.3-linux_amd64.tar.gz -C $BIN_PATH/fzf/bin
cd $BIN_PATH/fzf
./install --all
