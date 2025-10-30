#/bin/bash

source ./cc.cfg

tar -xf ../lua-5.4.8.tar.gz -C ./

cd lua-5.4.8

sed -i "s#INSTALL_TOP= /usr/local#INSTALL_TOP= $BIN_PATH/lua#" Makefile

#make 


