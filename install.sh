#!/bin/bash
# this shell is used to install the vimrc file to your home dir automaticly
# for more information , please mail me at arthurkiller21@gmail.com
trap exit ERR
pwd=`pwd`

function usage(){
cat << EOF
  USAGE:
    install.sh -i          install pulgin
    install.sh -c          cleanup .vimrc and plugins
    install.sh -b          backup .vim directory and .vimrc configs
    install.sh -h          show help information
EOF
exit 1
}

while getopts 'i:b:c:h' opt ; do
    case $opt in
    i) install ;;
    b) backup ;;
    c) clean ;;
    h) usage ;;
    *) usage ;;
    esac
done

function backup(){
if [ -d $HOME/.vim ]
then
    mv $HOME/.vim $HOME/.vim.bak
fi
if [ -e $HOME/.vimrc ]
then
    mv $HOME/.vimrc $HOME/.vimrc.bak
fi
if [ -e $HOME/.vimrc.plug ]
then
    mv $HOME/.vimrc.plug $HOME/.vimrc.plug.bak
fi
if [ -e $HOME/.vimrc.sign]
then
    mv $HOME/.vimrc.sign $HOME/.vimrc.sign.bak
fi
}


function clean(){
if [ -d $HOME/.vim ]
then
    rm -rf  $HOME/.vim
fi
if [ -h $HOME/.vimrc ]
then
    rm $HOME/.vimrc
fi
if [ -h $HOME/.vimrc.plug ]
then
    rm $HOME/.vimrc.plug
fi
}

function install(){
ln -s $pwd/vimrc $HOME/.vimrc
ln -s $pwd/vimrc.plug $HOME/.vimrc.plug
mkdir -p $HOME/.vim/autoload
ln -s $pwd/colors $HOME/.vim/colors
ln -s $pwd/ycm-plugin $HOME/.vim/ycm-plugin
}
