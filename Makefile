all: prepare
	./install.sh -i
	vim -c ':PlugInstall'

help:
	./install.sh -h

prepare:
	./install.sh -b
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
