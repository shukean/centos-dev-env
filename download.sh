#!/bin/bash

set -e
set -x

down_pkg() {
    if [ ! -f $1 ]; then
        wget -O $1 $2
    fi
}

# cmake
down_pkg cmake-3.14.7.tar.gz https://github.com/Kitware/CMake/releases/download/v3.14.7/cmake-3.14.7.tar.gz

# fzf-0.27.2
down_pkg fzf-0.56.3.tar.gz  https://github.com/junegunn/fzf/archive/refs/tags/0.56.3.tar.gz
down_pkg fzf-0.56.3-linux_amd64.tar.gz  https://github.com/junegunn/fzf/releases/download/v0.56.3/fzf-0.56.3-linux_amd64.tar.gz

# bzip2
down_pkg bzip2-1.0.8.tar.gz https://fossies.org/linux/misc/bzip2-1.0.8.tar.gz

# go
down_pkg go1.23.12.linux-amd64.tar.gz https://golang.org/dl/go1.23.12.linux-amd64.tar.gz

# libffi-3.4.2
down_pkg libffi-3.4.2.tar.gz https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz

# Python-3.8.11
down_pkg Python-3.8.11.tar.xz https://www.python.org/ftp/python/3.8.11/Python-3.8.11.tar.xz

# the_silver_searcher-2.2.0
down_pkg the_silver_searcher-2.2.0.tar.gz https://geoff.greer.fm/ag/releases/the_silver_searcher-2.2.0.tar.gz

down_pkg perl-5.42.0.tar.gz https://www.cpan.org/src/5.0/perl-5.42.0.tar.gz

down_pkg lua-5.4.8.tar.gz https://www.lua.org/ftp/lua-5.4.8.tar.gz

# vim-8.1.2424
down_pkg vim-8.1.2424.tar.gz https://github.com/vim/vim/archive/refs/tags/v8.1.2424.tar.gz

cd vim-plugs || exit 1

sh download_plug.sh
