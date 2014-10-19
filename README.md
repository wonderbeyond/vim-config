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

## Get started

Fetch the repo to `~/.vim`:

    $ git clone https://github.com/wonderbeyond/vim-config.git ~/.vim
    $ cd ~/.vim

Install neobundle:

    $ make inst-neobundle

Build YCM:

    $ make build-ycm

Link files:

    $ make link
