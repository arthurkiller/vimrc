#!/bin/bash
# this shell is used to install the vimrc file to your home dir automaticly
# for more information , please mail me at arthurkiller21@gmail.com
trap exit ERR
pwd=`pwd`

if [ "$1" == "-h" ] || [ "$1" == "-help" ] || [ "$1" == "--help" ]
then
    echo "USAGE:"
    echo "  install             mean you need install total pulgin"
    echo "  install -h          mean you wanna help"
    exit
fi

if [ -e $HOME/.vimrc ]
then
    mv $HOME/.vimrc $HOME/.vimrc.bak
fi
if [ -e $HOME/.vimrc.plug ]
then
    mv $HOME/.vimrc.plug $HOME/.vimrc.plug.bak
fi

if [ -h $HOME/.vimrc ]
then
    rm $HOME/.vimrc
fi
ln -s $pwd/vimrc $HOME/.vimrc

if [ -h $HOME/.vimrc.plug ]
then
    rm $HOME/.vimrc.plug
fi
ln -s $pwd/vimrc.plug $HOME/.vimrc.plug

if [ -d "$HOME/.vim" ]
then
    mv $HOME/.vim $HOME/.vim.bak
fi
if [ -h "$HOME/.vim" ]
then
    rm -rf $HOME/.vim
fi
mkdir -p $HOME/.vim/autoload
ln -s $pwd/colors $HOME/.vim/colors

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo Done! `date`
