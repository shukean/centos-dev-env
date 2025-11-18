#/bin/bash

#source ./cc.cfg
source ./path.cfg

tar -xf ../openssl-1.1.1w.tar.gz -C ./
cd openssl-1.1.1w


./config --prefix=$LIB_PATH/openssl-1.1.1w threads -fPIC

make --quiet -j12
make --quiet install > /dev/null

