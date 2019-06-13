all: prepare
	vim -c ':PlugInstall'


prepare:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	./install.sh -b
	./install.sh -i
