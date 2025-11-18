#!/bin/bash

#source ./cc.cfg
source ./path.cfg

export OPENSSL_ROOT_DIR=$LIB_PATH/openssl-1.1.1w

tar -xf ../cmake-3.14.7.tar.gz -C ./
cd cmake-3.14.7

sed -i "s/set(CMAKE_SKIP_RPATH ON/#set(CMAKE_SKIP_RPATH ON/" CMakeLists.txt
sed -i '689,695s/^/#/' CMakeLists.txt
sed -i '710,713s/^/#/' CMakeLists.txt
sed -i '723,728s/^/#/' CMakeLists.txt

sed -i '729i set(CMAKE_INSTALL_RPATH_USE_LINK_PATH ON CACHE BOOL "Install with RPATH set to find custom-built libraries.")' CMakeLists.txt
sed -i '730i set(CMAKE_BUILD_WITH_INSTALL_RPATH ON CACHE BOOL "Build with RPATH set to match install-tree RPATH.")' CMakeLists.txt
sed -i '731i mark_as_advanced(CMAKE_INSTALL_RPATH_USE_LINK_PATH CMAKE_BUILD_WITH_INSTALL_RPATH)' CMakeLists.txt

./bootstrap --prefix=$BIN_PATH/cmake

make -j12 && make install
