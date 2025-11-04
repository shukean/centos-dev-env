#!/bin/bash

source ./cc.cfg

tar -xf ../ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz -C $BIN_PATH
mv $BIN_PATH/ripgrep-15.1.0-x86_64-unknown-linux-musl $BIN_PATH/ripgrep
