#!/bin/bash
# this shell is used to install the vimrc file to your home dir automaticly
# for more information , please mail me at arthurkiller21@gmail.com
trap exit ERR
if [ $1 == "-h" ] || [ $1 == "-help" ] || [ $1 == "--help" ]
then
	echo "USAGE:"
	echo "	install				mean just update the .vim file"
	echo "	install -h			mean you wanna help"
	echo "	install -init 			mean you need install total pulgin"
	exit
fi

if [ -e $HOME/.vimrc ]
then
	rm $HOME/.vimrc
fi
if [ -e $HOME/.vimrc.vundle ]
then
	rm $HOME/.vimrc.vundle
fi

if [ -h $HOME/.vimrc ]
then
	rm $HOME/.vimrc
fi
ln -s vimrc $HOME/.vimrc

if [ -h $HOME/.vimrc.vundle ]
then
	rm $HOME/.vimrc.vundle
fi
ln -s vimrc.vundle $HOME/.vimrc.vundle 

if [ -h "$HOME/.vim" ]
then
    rm -rf $HOME/.vim
fi
if [ -d "$HOME/.vim" ]
then
    rm -rf $HOME/.vim
fi
cp -r vim $HOME/.vim
echo update succeed 
echo `date`

if [ $1 == "-init" ]
then
	echo starting download the vundle pulgin
    mkdir $HOME/.vim/bundle && cd $HOME/.vim/bundle 
   	git clone https://github.com/gmarik/Vundle.vim.git
   	git clone https://github.com/tpope/vim-fugitive.git
   	git clone https://github.com/Valloric/YouCompleteMe.git
   	git clone https://github.com/kien/ctrlp.vim.git
   	git clone https://github.com/scrooloose/nerdtree.git
   	git clone https://github.com/bling/vim-airline.git
   	git clone https://github.com/majutsushi/tagbar.git
   	git clone https://github.com/fatih/vim-go.git
   	(cd $HOME/.vim/bundle/YouCompleteMe/ && git submodule update --init --recursive \
   	    && ./install.py --gocode-completer --clang-completer)
fi
