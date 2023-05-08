#!/bin/bash

set -x
set -e

function clone() {
    #git clone git@github.com:$1.git
    git clone https://github.com/$1.git
    if [ ! -z "$2" ]; then
        dir=`echo $1 | cut -d/ -f2`
        cd $dir
        git checkout $2
        cd -
    fi
}

mkdir -p ./plugged
cd plugged || exit 1

clone Raimondi/delimitMate
clone junegunn/fzf.vim
clone preservim/nerdcommenter
clone preservim/nerdtree
clone preservim/tagbar
clone vim-airline/vim-airline
clone vim-airline/vim-airline-themes
clone derekwyatt/vim-fswitch
clone rondale-sc/vim-spacejam
clone bronson/vim-trailing-whitespace
clone ycm-core/YouCompleteMe 518275b599ab6dd7844c24022f6aec505fb4b07c

cd YouCompleteMe || exit 1
git submodule update --init --recursive

wget -O absl.tar.gz https://github.com/abseil/abseil-cpp/archive/refs/tags/20210324.2.tar.gz
tar xf absl.tar.gz
mv abseil-cpp-20210324.2 absl
rm -f absl.tar.gz
rm -rf ./third_party/ycmd/cpp/absl
mv absl ./third_party/ycmd/cpp/

wget -O libclang-12.0.0-x86_64-unknown-linux-gnu.tar.bz2  https://github.com/ycm-core/llvm/releases/download/12.0.0/libclang-12.0.0-x86_64-unknown-linux-gnu.tar.bz2
mkdir ./third_party/ycmd/clang_archives/
mv libclang-12.0.0-x86_64-unknown-linux-gnu.tar.bz2 ./third_party/ycmd/clang_archives/

sed -i 's/GIT_REPOSITORY https:\/\/github.com\/abseil/# &/'  third_party/ycmd/cpp/CMakeLists.txt
sed -i 's/GIT_TAG 3b4a16abad2c2ddc494371cc39a2946e36d35d11/# &/' third_party/ycmd/cpp/CMakeLists.txt


