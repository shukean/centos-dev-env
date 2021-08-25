#!/bin/bash

set -e
set -x

# cmake-3.20.5
wget -o cmake-3.21.1.tar.gz https://github.com/Kitware/CMake/releases/download/v3.21.1/cmake-3.21.1.tar.gz

# fzf-0.27.2 
wget -o fzf-0.27.2.tar.gz  https://github.com/junegunn/fzf/archive/refs/tags/0.27.2.tar.gz

# go-1.16.7
wget https://golang.org/dl/go1.16.7.linux-amd64.tar.gz

# libffi-3.4.2
wget -o libffi-3.4.2.tar.gz https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz

# Python-3.8.11
wget -o Python-3.8.11.tar.xz https://www.python.org/ftp/python/3.8.11/Python-3.8.11.tar.xz

# the_silver_searcher-2.2.0
wget -o the_silver_searcher-2.2.0.tar.gz https://geoff.greer.fm/ag/releases/the_silver_searcher-2.2.0.tar.gz

# vim-8.1.2424
wget -o vim-8.1.2424.tar.gz https://github.com/vim/vim/archive/refs/tags/v8.1.2424.tar.gz
