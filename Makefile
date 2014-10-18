all: inst-neobundle link

inst-neobundle:
	curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

link:
	ln -s $(PWD)/vimrc ~/.vimrc
	ln -s $(PWD)/gvimrc ~/.gvimrc
