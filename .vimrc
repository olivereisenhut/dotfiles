call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
call plug#end()

"enable syntax highlighting
syntax enable

filetype on
filetype indent on
filetype plugin indent on

"shows existing tab with 4 spaces width
set tabstop=4
"when indenting with '>', use 4 spaces width
set shiftwidth=4
"On pressing tab, insert 4 spaces
set expandtab

"Set line numbers
set number