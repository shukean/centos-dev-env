# 离线安装

执行初始化脚本, 将依赖包对应的软件版本下载到本地.  
```
git clone https://github.com/shukean/centos-dev-env.git
cd centos-dev-env
sh download.sh
```

上传 centos-dev-env 包到 $HOME 目录下.
``` bash
cd $HOME/centos-dev-env
```

## Install libffi-3.4.2
> 如果编译 Python 后提示缺少 _ctypes, 就需要先安装.  
> Python 和 YouCompleteMe 依赖.  
``` bash
tar -xf -C ./ libffi-3.4.2.tar.gz
cd libffi-3.4.2
./configure \
    --prefix="$HOME/.local/lib/ffi-3.4.2"   \
    CC=/opt/compiler/gcc-10/bin/gcc     \
    CPPFLAGS="-I/opt/compiler/gcc-10/include" \
    LDFLAGS="-Wl,-R/opt/compiler/gcc-10/lib"
    
make -j12 && make install
```

## Install Python-3.8.11 
> GCC 10 下 Python-3.7.x 编译报错.  

``` bash
tar -xf -C ./ Python-3.8.11.tar.xz
cd Python-3.8.11
./configure --prefix=$HOME/.local/python/3.8.11 \
--enable-optimizations  \
--enable-shared     \
CC=/opt/compiler/gcc-10/bin/gcc     \
CXX=/opt/compiler/gcc-10/bin/g++     \
CPPFLAGS="-I/opt/compiler/gcc-10/include -I$HOME/.local/lib/ffi-3.4.2/include -I$HOME/.local/lib/bzip2-1.0.8/include" \
LDFLAGS="-Wl,-R$HOME/.local/python/3.8.11/lib -Wl,-R/opt/compiler/gcc-10/lib -Wl,-R$HOME/.local/lib/ffi-3.4.2/lib -Wl,-R$HOME/.local/lib/bzip2-1.0.8/lib -L$HOME/.local/lib/ffi-3.4.2/lib -L/opt/compiler/gcc-10/lib -L$HOME/.local/lib/bzip2-1.0.8/lib" \
LIBS="-lffi -lbz2"
```  

> 这里我先安装了 bzip2 库. 如果不需要可以在编译命令中去掉.  
### Install bzip2-1.0.8.tar.gz
``` bash
# 先修改 Makefile 文件
CC=/opt/compiler/gcc-10/bin/gcc
AR=/opt/compiler/gcc-10/bin/ar
RANLIB=/opt/compiler/gcc-10/bin/ranlib
LDFLAGS=

# 然后编译, 保持 gcc 版本一致
make -f Makefile-libbz2_so
mkdir -p $HOME/.local/lib/bzip2-1.0.8/bin
cp bzip2-shared $HOME/.local/lib/bzip2-1.0.8/bin
mkdir -p $HOME/.local/lib/bzip2-1.0.8/lib
cp libbz2.so.1.0.8 $HOME/.local/lib/bzip2-1.0.8/lib
ln -s $HOME/.local/lib/bzip2-1.0.8/lib/libbz2.so.1.0.8 $HOME/.local/lib/bzip2-1.0.8/lib/libbz2.so.1.0
mkdir -p $HOME/.local/lib/bzip2-1.0.8/include
cp *\.h $HOME/.local/lib/bzip2-1.0.8/include
```

## Install  go1.16.7
> fzf 依赖 
``` bash
rm -rf $HOME/.local/go && tar -C $HOME/.local -xzf go1.16.7.linux-amd64.tar.gz
```

## Install cmake-3.20.5
> YouCompleteMe 依赖
``` bash 
tar -xf -C ./ cmake-3.20.5.tar.gz
cd cmake-3.20.5
./configure --prefix=$HOME/.local/cmake/3.20.5  \
    CC=/opt/compiler/gcc-10/bin/gcc \
    CXX=/opt/compiler/gcc-10/bin/g++    \
    CPPFLAGS="-I/opt/compiler/gcc-10/include"   \
    LDFLAGS="-Wl,-R/opt/compiler/gcc-10/lib -L/opt/compiler/gcc-10/lib"

make -j12 && make install
```

## Install the_silver_searcher-2.2.0
> fzf 插件快速搜索依赖.  
> 依赖 pcre.  

``` bash
tar -xf -C ./ the_silver_searcher-2.2.0.tar.gz
cd the_silver_searcher-2.2.0
./configure --prefix=$HOME/.local/the_silver_searcher  \
CC="/usr/bin/gcc" \
PCRE_LIBS="-L$HOME/.local/lib -lpcre"  \
PKG_CONFIG="/usr/bin/pkg-config"

make -j12 && make install
```

> PCRE_LIBS 和 PKG_CONFIG 用于指定 pcre 的路径, 否则可能提示找不到 pcre.  

## Install fzf-0.27.2 
> 用于搜索文件.  

解压后安装:  
``` bash
tar -xf -C ./ fzf-0.27.2.tar.gz
cd fzf
./install --all
```

快速安装:  
``` bash
wget https://github.com/junegunn/fzf/releases/download/0.27.2/fzf-0.27.2-linux_amd64.tar.gz
```

## Install  vim-8.1.2424

解压后安装:  
``` bash
tar -xf -C ./ vim-8.1.2424.tar.gz
cd vim-8.1.2424
./configure --with-features=huge \
    --enable-terminal \
    --enable-multibyte \
    --enable-python3interp=yes \
    --with-python3-config-dir=$HOME/.local/python/3.8.11/lib/python3.8/config-3.8-x86_64-linux-gnu \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=$HOME/.local/vim   \
    CC=/opt/compiler/gcc-10/bin/gcc \
    CXX=/opt/compiler/gcc-10/bin/g++ \
    CFLAGS="-I/opt/compiler/gcc-10/include" \
    LDFLAGS="-Wl,-R$HOME/.local/python/3.8.11/lib -Wl,-R/opt/compiler/gcc-10/lib -L/opt/compiler/gcc-10/lib -rdynamic" \
    LIBS="-lncurses"
    
make -j12 && make install
```

>  如果提示 `ncurses` 找不到, 则先安装下.  

## Install Vim Plugin
``` bash
cd vim-plugs
sh download_plug.sh

# Install YouCompleteMe
cd vim-plugs/plugged/YouCompleteMe
env CC=/opt/compiler/gcc-10/bin/gcc \
    CXX=/opt/compiler/gcc-10/bin/g++ \
    CFLAGS="-I/opt/compiler/gcc-10/include" \
    LDFLAGS="-Wl,-R/opt/compiler/gcc-10/lib -L/opt/compiler/gcc-10/lib"   \
    $HOME/.local/python/3.8.11/bin/python3 ./install.py --clang-completer

# 创建软连接
cd $HOME
ln -s centos-dev-env/vimrc .vimrc
ln -s centos-dev-env/fzf .fzf
ln -s centos-dev-env/vim-plugs .vim
cd $HOME/.local
ln -s $HOME/centos-dev-env/local_bashrc bashrc

# 修改 PATH
echo "[[ -s '$HOME/.local/bashrc' ]] && source '$HOME/.local/bashrc'" >> .bashrc
```


---
> 将 YouCompleteMe 修改为离线安装 (vim-plugs.tar.gz 已包含此修改)
## Install YouCompleteMe
**commit**: 518275b599ab6dd7844c24022f6aec505fb4b07c  
下载:  
``` bash
git clone https://github.com/ycm-core/YouCompleteMe.git
cd YouCompleteMe
git checkout 518275b599ab6dd7844c24022f6aec505fb4b07c
git submodule update --init --recursive
```

### 修改为离线安装 
#### 下载 abseil
解压后将其移动到 `YouCompleteMe/third_party/ycmd/cpp` 目录下, 并重名为 `absl`  
修改 YouCompleteMe/third_party/ycmd/cpp/CMakeLists.txt 将以下内容:  
``` bash
  FetchContent_Declare(
    absl
    GIT_REPOSITORY https://github.com/abseil/abseil-cpp
    GIT_TAG 3b4a16abad2c2ddc494371cc39a2946e36d35d11
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/absl
  )
```
修改为:  
``` bash
  FetchContent_Declare(
    absl
    # GIT_REPOSITORY https://github.com/abseil/abseil-cpp
    # GIT_TAG 3b4a16abad2c2ddc494371cc39a2946e36d35d11
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/absl
  )
```

#### 下载 libclang
下载  https://github.com/ycm-core/llvm/releases/download/12.0.0/libclang-12.0.0-x86_64-unknown-linux-gnu.tar.bz2  
将下载的文件移动到 YouCompleteMe/third_party/ycmd/clang_archives 目录下.  

> 需要 sha256 值一样.  



