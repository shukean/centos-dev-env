#!/bin/bash

set -x 
set -e 

CUR_PATH=`pwd`
WORK_PATH="$HOME"

if [ -z $WORK_PATH -o ! -d $WORK_PATH ]; then
    echo "not found work path"
    exit 1
fi

do_link_dir_or_file() {
    src=$1
    dst=$2
    if [ -f $dst -o -d $dst ]; then
	realf=`readlink $dst`
        if [ "x$realf" = "x$src" ]; then
            return 0
        else
            echo "ln -s $src $dst failed, $dst exists"
            exit 1
        fi
    else
        ln -s $src $dst
    fi
}

do_link_dir_or_file $CUR_PATH/vimrc $WORK_PATH/.vimrc
do_link_dir_or_file $CUR_PATH/vim-plugs $WORK_PATH/.vim
do_link_dir_or_file $CUR_PATH/local/bin/fzf $WORK_PATH/.fzf
do_link_dir_or_file $CUR_PATH/ycm_extra_conf.py $WORK_PATH/.ycm_extra_conf.py
do_link_dir_or_file $CUR_PATH/ag_ignore $WORK_PATH/.agignore

mkdir -p $WORK_PATH/.local/bin

do_link_bin() {
    for name in `ls $1`; do
        do_link_dir_or_file $1/$name $WORK_PATH/.local/bin/$name
    done
}

do_link_bin $CUR_PATH/local/bin/cmake/bin
do_link_bin $CUR_PATH/local/bin/python/bin
do_link_bin $CUR_PATH/local/bin/the_silver_searcher/bin
do_link_bin $CUR_PATH/local/bin/vim/bin
do_link_bin $CUR_PATH/local/bin/fzf/bin
do_link_bin $CUR_PATH/local/bin/go/bin

do_link_dir_or_file $CUR_PATH/local/bin/ripgrep/rg $WORK_PATH/.local/bin/rg

if [ ! -f $HOME/.bash_profile ]; then
    do_link_dir_or_file $CUR_PATH/bash_profile $HOME/.bash_profile
fi

do_link_dir_or_file $CUR_PATH/local_bashrc $WORK_PATH/.local/bashrc

set +e
grep "$WORK_PATH/.local/bashrc" $WORK_PATH/.bashrc >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
    echo "[ -f $WORK_PATH/.local/bashrc ] && source $WORK_PATH/.local/bashrc" >> $WORK_PATH/.bashrc
fi

echo "source $WORK_PATH/.local/bashrc"
