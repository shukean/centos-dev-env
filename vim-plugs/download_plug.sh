#!/bin/bash

set -x
set -e

function clone() {
    #git clone git@github.com:$1.git
    dir=`echo $1 | cut -d/ -f2`
    if [ -d $dir ]; then
        if [ -z "$2" ]; then
            return 0
        fi
        ci=$(cd $dir; git log -1 --format="%H")
        if [ "x$ci" == "x$2" ]; then
            return 0
        fi
        rm -rf $dir
    fi
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

clone Raimondi/delimitMate becbd2d353a2366171852387288ebb4b33a02487
clone junegunn/fzf.vim 879db51d0965515cdaef9b7f6bdeb91c65d2829e
clone preservim/nerdcommenter 02a3b6455fa07b61b9440a78732f1e9b7876c991
clone preservim/nerdtree 690d061b591525890f1471c6675bcb5bdc8cdff9
clone preservim/tagbar 7bfffca1f121afb7a9e38747500bf5270e006bb1
clone vim-airline/vim-airline 159573187e9996d06cf26e49a533f424f4d70b43
clone vim-airline/vim-airline-themes 77aab8c6cf7179ddb8a05741da7e358a86b2c3ab
clone shukean/vim-fswitch b4bfbae2bba8651588f5801fac44639381123350
clone rondale-sc/vim-spacejam cdaa007868b5781b5d86c336c24c6276c3795387
clone bronson/vim-trailing-whitespace 5540b3faa2288b226a8d9a4e8244558b12c598aa
clone ycm-core/YouCompleteMe 518275b599ab6dd7844c24022f6aec505fb4b07c
clone zivyangll/git-blame.vim

cd YouCompleteMe || exit 1
git submodule update --init --recursive

if [ ! -f absl.tar.gz ]; then
    wget -O absl.tar.gz https://github.com/abseil/abseil-cpp/archive/refs/tags/20210324.2.tar.gz
fi
tar xf absl.tar.gz
mv abseil-cpp-20210324.2 absl
rm -rf ./third_party/ycmd/cpp/absl
mv absl ./third_party/ycmd/cpp/

if [ ! -f libclang-12.0.0-x86_64-unknown-linux-gnu.tar.bz2 ]; then
    wget -O libclang-12.0.0-x86_64-unknown-linux-gnu.tar.bz2  https://github.com/ycm-core/llvm/releases/download/12.0.0/libclang-12.0.0-x86_64-unknown-linux-gnu.tar.bz2
fi
mkdir -p ./third_party/ycmd/clang_archives/
cp libclang-12.0.0-x86_64-unknown-linux-gnu.tar.bz2 ./third_party/ycmd/clang_archives/

#sed -i 's/GIT_REPOSITORY https:\/\/github.com\/abseil/# &/'  third_party/ycmd/cpp/CMakeLists.txt
#sed -i 's/GIT_TAG 3b4a16abad2c2ddc494371cc39a2946e36d35d11/# &/' third_party/ycmd/cpp/CMakeLists.txt
