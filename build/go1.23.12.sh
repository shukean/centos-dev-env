#!/bin/bash

source ./cc.cfg

rm -rf $BIN_PATH/go && tar -C $BIN_PATH -xzf ../go1.23.12.linux-amd64.tar.gz
