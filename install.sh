#!/bin/bash
# this shell is used to install the vimrc file to your home dir automaticly
# for more information , please mail me at arthurkiller21@gmail.com
trap exit ERR

if [ ! -d "~/.vim" ]; then
    rm -rf ~/.vim 
fi
cp -r vim ../.vim

cp vimrc ../.vimrc
cp vimrc.vundle ../.vimrc.vundle

if [ ! -d "~/.vim/bundle" ]; then
    mkdir ~/.vim/bundle
fi

cd ~/.vim/bundle 
git clone https://github.com/gmarik/Vundle.vim.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/Valloric/YouCompleteMe.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/fatih/vim-go.git

(cd ~/.vim/bundle/YouCompleteMe/ && git submodule update --init --recursive \
        && ./install.py --all)

