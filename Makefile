all: prepare
	./install.sh -i
	vim -c ':PlugInstall'

help:
	echo "make install	install pulgin"
	echo "make clean	cleanup .vimrc and plugins"
	echo "make backup	backup .vim directory and .vimrc configs"
	echo "make help 	show help information"

backup:
	mv ${HOME}/.vim ${HOME}/.vim.bak
	mv ${HOME}/.vimrc ${HOME}/.vimrc.bak
	mv ${HOME}/.vimrc.plug ${HOME}/.vimrc.plug.bak
	mv ${HOME}/.vimrc.sign ${HOME}/.vimrc.sign.bak

clean:
	rm -rf  ${HOME}/.vim
	rm ${HOME}/.vimrc
	rm ${HOME}/.vimrc.plug

install:
	mkdir /.vim
	ln -s ${pwd}/vimrc ${HOME}/.vimrc
	ln -s ${pwd}/vimrc.plug ${HOME}/.vimrc.plug
	ln -s ${pwd}/vimrc.sign ${HOME}/.vimrc.sign
	ln -s ${pwd}/autoload ${HOME}/.vim/autoload
	ln -s ${pwd}/colors ${HOME}/.vim/colors
	vim -c ':PlugInstall'
