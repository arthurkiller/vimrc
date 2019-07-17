all: prepare
	./install.sh -i
	vim -c ':PlugInstall'

help:
	echo "make install	install pulgin"
	echo "make clean	cleanup .vimrc and plugins"
	echo "make backup	backup .vim directory and .vimrc configs"
	echo "make help 	show help information"

prepare:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

backup:
	mv $HOME/.vim $HOME/.vim.bak
	mv $HOME/.vimrc $HOME/.vimrc.bak
	mv $HOME/.vimrc.plug $HOME/.vimrc.plug.bak
	mv $HOME/.vimrc.sign $HOME/.vimrc.sign.bak

clean:
	rm -rf  $HOME/.vim
	rm $HOME/.vimrc
	rm $HOME/.vimrc.plug

install:
	ln -s $pwd/vimrc $HOME/.vimrc
	ln -s $pwd/vimrc.plug $HOME/.vimrc.plug
	mkdir -p $HOME/.vim/autoload
	ln -s $pwd/colors $HOME/.vim/colors
	ln -s $pwd/ycm-plugin $HOME/.vim/ycm-plugin
	vim -c ':PlugInstall'
