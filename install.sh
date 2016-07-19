#!/bin/bash
# this shell is used to install the vimrc file to your home dir automaticly
# for more information , please mail me at arthurkiller21@gmail.com

cp -r vimrc ../.vimrc
cp -r vim ../.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
