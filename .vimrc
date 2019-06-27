" ====
"Plugs
" ====
call plug#begin('~/.vim/plugged')
    " Navigation
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } 
    Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

    " Colors and Look
    Plug 'challenger-deep-theme/vim'
    Plug 'bling/vim-airline'

    " Code editing
    Plug 'w0rp/ale'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
call plug#end()


" =========
" Indenting
" ========= 

filetype on
filetype indent on
filetype plugin indent on

"==========
" Editor config
" =========
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"Set line numbers
set number

" =================
" Themes and Colors
" =================
colorscheme challenger_deep
"enable syntax highlighting
syntax on
" True color
if has('nvim') || has('termguicolors')
  set termguicolors
endif
" ========
" NERDTree
" ========
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
