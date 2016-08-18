#!/bin/bash
# this shell is used to install the vimrc file to your home dir automaticly
# for more information , please mail me at arthurkiller21@gmail.com
trap exit ERR

if [ ! -d "$HOME/.vim" ]; then
    rm -rf $HOME/.vim 
fi
cp -r vim $HOME
mv $HOME/vim .vim

cp vimrc $HOME/.vimrc
cp vimrc.vundle $HOME/.vimrc.vundle

if [ ! -d "$HOME/.vim/bundle" ]; then
    mkdir $HOME/.vim/bundle
fi

cd $HOME/.vim/bundle 
git clone https://github.com/gmarik/Vundle.vim.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/Valloric/YouCompleteMe.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/fatih/vim-go.git

(cd $HOME/.vim/bundle/YouCompleteMe/ && git submodule update --init --recursive \
        && ./install.py --all)
