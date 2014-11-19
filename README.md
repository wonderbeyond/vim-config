vim-config
==========

wonders vim config repository

## Dependencies

- python
- ctags
- build-essential
- python-dev
- libclang-3.5
- cmake
- pyflakes: Python source checker(alernatives: pylint, pep8)
- jshint(via npm)
- js-beautify(via npm)

## Get started

### Fetch the repo to `~/.vim`:

    $ git clone https://github.com/wonderbeyond/vim-config.git ~/.vim
    $ cd ~/.vim

### Link files(eg. ~/.vimrc):

    $ make link

### Install neobundle:

    $ make inst-neobundle

### Install all plugins via neobundle:

Open vim, you will see a question "Install bundles now?", select "Yes" to continue.

### Build YCM:

    $ make build-ycm
