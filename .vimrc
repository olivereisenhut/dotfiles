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

    " Langauge Support
    " => JS & Frontend
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'leafgarland/typescript-vim'

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
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
