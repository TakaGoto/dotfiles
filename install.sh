#!/bin/bash

git submodule update --init

ln -s vim_files ~/.vim
ln -s vim_files/.vimrc ~/.vimrc
ln -s tmux_files/.tmux.conf ~/.tmux.conf
