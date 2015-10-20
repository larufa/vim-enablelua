#!/bin/bash

yum install -y zsh git ncurses-devel lua-devel perl-ExtUtils-Embed  python-devel
chsh -s /bin/zsh
yum remove -y vim

cp .zshrc ~/
cp .vimrc ~/
cp .gitconfig ~/

cd /usr/local/src/

if [ ! -e /usr/local/src/vim-7.4.tar.bz2 ]; then
	wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
	tar xvf vim-7.4.tar.bz2
fi

cd vim74

if [ ! -e /usr/local/bin/vim ]; then
	make distclean

	./configure \
	 --enable-multibyte \
	 --with-features=huge \
	 --enable-luainterp \
	 --enable-pythoninterp \
	 --with-python-config-dir=/usr/lib64/python2.6/config \
	 --enable-rubyinterp \
	 --with-ruby-command=/usr/bin/ruby \

	make
	make install

	cp /usr/local/src/vim74/src/vim /usr/local/bin/
else
	if [ ! -e ~/.vim/bundle ]; then
		mkdir -p ~/.vim/bundle
		git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
	fi
fi

	
