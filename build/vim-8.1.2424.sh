#!/bin/bash

source ./cc.cfg

rm -rf vim-8.1.2424

tar -xf ../vim-8.1.2424.tar.gz -C ./

cd vim-8.1.2424

if [ ! -d $BIN_PATH/python/lib/python3.8/config-3.8-x86_64-linux-gnu ]; then
    echo "not found python"
    exit 1
fi

export PATH="$BIN_PATH/python/bin:$PATH"

./configure --prefix=$BIN_PATH/vim   \
    --enable-fail-if-missing \
    --with-features=huge \
    --enable-terminal \
    --enable-multibyte \
    --enable-python3interp=yes \
    --enable-perlinterp=yes \
    --enable-rubyinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=gtk2 \
    --enable-cscope \
    CPPFLAGS="-I$BIN_PATH/python/include $CPPFLAGS" \
    LDFLAGS="-L$BIN_PATH/python/lib $LDFLAGS -Wl,-R$BIN_PATH/python/lib -Wl,-R/usr/lib64 -rdynamic -L$LIB_PATH/bzip2-1.0.8/lib -L$LIB_PATH/ffi-3.4.2/lib -L/usr/lib64" \
    LIBS="-lncurses"

#see vim-8.1.2424/src/auto/config.log 
    
make -j12 && make install

$BIN_PATH/vim/bin/vim --version
