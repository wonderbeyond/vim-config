"NeoBundle Scripts-----------------------------
if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
""NeoBundle 'Shougo/neosnippet.vim'
""NeoBundle 'Shougo/neosnippet-snippets'
""NeoBundle 'tpope/vim-fugitive'
""NeoBundle 'kien/ctrlp.vim'
""NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'jkeylu/vimcdoc'
NeoBundle 'FredKSchott/CoVim'
NeoBundle 'mbriggs/mark.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'wonderbeyond/template.vim'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'majutsushi/tagbar'

"Language base support
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
"NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less'
NeoBundle 'evanmiller/nginx-vim-syntax'
NeoBundle 'hdima/python-syntax'
NeoBundle 'hynek/vim-python-pep8-indent' "Good & Suitable

"Dev enhancement
NeoBundle 'Crapworks/python_fn.vim'
NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'vim-scripts/Pydiction'           "Tab-complete Python code *using dictionary* (`g:pydiction_location`)
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'tomtom/tlib_vim'                 "required by SnipMate
NeoBundle 'MarcWeber/vim-addon-mw-utils'    "required by SnipMate
NeoBundle 'garbas/vim-snipmate'             "SnipMate aims to provide support for textual snippets
"NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'              "provide snippets work with SnipMate
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tmhedberg/matchit'               "using % to match more

"Utils
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'airblade/vim-gitgutter'          "shows git diff in the 'gutter' (sign column).
"NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdcommenter'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

syntax enable

if has('gui_running')
    set background=light
    colorscheme solarized
else
    "set background=dark
    "colorscheme solarized
endif

set nocp
set number
set fileencodings=ucs-bom,utf-8,gb2312,default,latin1
set autochdir
set textwidth=0

set autoindent
" smartindent对没有缩进文件可用的语言有用
set smartindent
" filetype indent on 会自动为 C 文件开启下面的选项
""set cindent

" cinoptions 定制 C 缩进细节.
" tN 影响返回值类型声明; (N 影响分行书写的 () 中的内容;
" jN 正确地缩进 Java 匿名类; JN 正确缩进 JavaScript 对象声明;
" :N 影响 switch 中的 case 标号的缩进;
"set cinoptions=g0,:0,i0,t0
set cinoptions=g0,:0,i0,t0,(0,j1,J1
set clipboard=unnamedplus

" 一个层缩进的长度
set tabstop=4   "文件中一个 <Tab> 显示的长度(按空格数计算)
set softtabstop=4
set shiftwidth=4
set expandtab

"BEGIN filetype custom---------------------------------
autocmd FileType make setlocal noexpandtab
autocmd FileType python setlocal ft=python.django
"autocmd FileType python setlocal dict=~/.vim/dict/pycomplete-dict
"autocmd FileType python setlocal omnifunc=pysmell#Complete

autocmd FileType html,xhtml setlocal ft=htmldjango.html
autocmd FileType html,xhtml setlocal expandtab shiftwidth=4 softtabstop=4

autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2

au BufRead,BufNewFile *.txt,*.md setlocal ft=markdown
au BufRead,BufNewFile *.js setlocal ft=javascript syntax=jquery
"END filetype custom-----------------------------------

set showcmd
set incsearch
set hlsearch    "High light search
set tags=./tags,../tags
set dict+=/usr/share/dict/words
set sessionoptions+=winpos,resize,winsize
set whichwrap=b,s
" wrap模式遇长行时, 在合适的地方回绕显示.
set wrap
" linebreak 保证不在单词中间回绕
set linebreak
"set virtualedit=all

map <F2> <Esc>:NERDTreeToggle<CR>
imap <F2> <Esc>:NERDTreeToggle<CR>

" 保存时自动编译less到css
function! Wless()
    write
    !lessc %:p %:p:r.css
endfunction
command Wless call Wless()

" 为一些插件而设置

" 激活模板
let g:enable_template = 1
"let g:template_cursor_mark = "#CURSOR#"

" pydiction
let g:pydiction_location = "~/.vim/bundle/Pydiction/complete-dict,/usr/share/dict/words"

" ZenCoding(Emmet-vim)
let g:user_emmet_leader_key = '<C-Z>'
" Note that the trailing , still needs to be entered, so the new keymap would be <C-Z>,.

"" For taglist
"let Tlist_Use_Right_Window = 1
"let Tlist_Use_SingleClick = 1
"map <F3> <Esc>:TlistToggle<CR>
"imap <F3> <Esc>:TlistToggle<CR>

" For tagbar
nmap <F3> :TagbarToggle<CR>
imap <F3> <Esc>:TagbarToggle<CR>

let g:airline#extensions#tabline#enabled = 1 "enable vim-airline

" for YCM, fix conflicts of <tab> key with SnipMate
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" Send python path to vim path
if has('python')
python << EOF
import os, sys, vim
import warnings

#check if in virtualenv
if 'VIRTUAL_ENV' in os.environ:
    envdir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(envdir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
    vim.command("let g:pythonworkon = '%s'" % os.path.basename(envdir))

pypaths = [ p.replace(' ', r'\ ') for p in sys.path if os.path.isdir(p) ]
tags_paths = filter(os.path.exists, [os.path.join(p, 'tags') for p in pypaths])

if not tags_paths:
    warnings.warn('Not any tags found in python `sys.path`, which can be generated with ctags')

vim.command(r"set path+=%s" % ','.join(pypaths))
vim.command(r"set tags+=%s" % ','.join(tags_paths))
EOF
endif

