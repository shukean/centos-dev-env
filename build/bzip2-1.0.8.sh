#/bin/bash

source ./cc.cfg

tar -xf ../bzip2-1.0.8.tar.gz -C ./
cd bzip2-1.0.8


sed -i "s#CC=gcc#CC=$mCC#" Makefile
sed -i "s#AR=ar#AR=$mAR#" Makefile
sed -i "s#RANLIB=ranlib#RANLIB=$mRANLIB#" Makefile
sed -i "s#LDFLAGS=#LDFLAGS=$mLDFLAGS#" Makefile

sed -i "s#CC=gcc#CC=$mCC#" Makefile-libbz2_so

make -j8 -f Makefile-libbz2_so

mkdir -p $LIB_PATH/bzip2-1.0.8/bin
mkdir -p $LIB_PATH/bzip2-1.0.8/lib
mkdir -p $LIB_PATH/bzip2-1.0.8/include

cp bzip2-shared $LIB_PATH/bzip2-1.0.8/bin
cp libbz2.so.1.0.8 $LIB_PATH/bzip2-1.0.8/lib
ln -s $LIB_PATH/bzip2-1.0.8/lib/libbz2.so.1.0.8 $LIB_PATH/bzip2-1.0.8/lib/libbz2.so.1.0
ln -s $LIB_PATH/bzip2-1.0.8/lib/libbz2.so.1.0.8 $LIB_PATH/bzip2-1.0.8/lib/libbz2.so
cp *\.h $LIB_PATH/bzip2-1.0.8/include

