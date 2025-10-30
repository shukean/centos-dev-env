#!/bin/bash

source ../build/cc.cfg

grep '# GIT_TAG 3b4a16abad2c2ddc494371cc39a2946e36d35d11' ./plugged/YouCompleteMe/third_party/ycmd/cpp/CMakeLists.txt
if [ $? -ne 0 ]; then
  sed -i 's/GIT_REPOSITORY https:\/\/github.com\/abseil/# &/'  ./plugged/YouCompleteMe/third_party/ycmd/cpp/CMakeLists.txt
  sed -i 's/GIT_TAG 3b4a16abad2c2ddc494371cc39a2946e36d35d11/# &/' ./plugged/YouCompleteMe/third_party/ycmd/cpp/CMakeLists.txt
fi

cd ./plugged/YouCompleteMe


export PATH=$BIN_PATH/cmake/bin:$PATH

$BIN_PATH/python/bin/python3 ./install.py --clang-completer


