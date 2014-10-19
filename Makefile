all: inst-neobundle link

inst-neobundle:
	curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

build-ycm:
	cd ~/.vim/bundle/YouCompleteMe; \
		./install.sh --clang-completer

link:
	ln -s $(PWD)/vimrc ~/.vimrc
	ln -s $(PWD)/gvimrc ~/.gvimrc
