set nocompatible              " be iMproved, required
filetype off                  " required

" Auto-install plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Themes
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'beikome/cosme.vim'

" Tools
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'townk/vim-autoclose'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'w0rp/ale'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'

" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'tomlion/vim-solidity'
Plug 'elzr/vim-json'
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
set nocompatible
set langmenu=none
set number

" Tab spacing
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set expandtab
set smarttab

" Plugin Configurations
autocmd vimenter * NERDTree

let g:typescript_compiler_binary = 'tsc'
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['eslint']}
let g:ale_fix_on_save = 1

" Theme configuration
syntax enable
colorscheme cosme

" Key mappings
au! BufWritePost .vimrc so %
au! BufWritePost .gvimrc so %
au BufRead,BufNewFile *.scss set filetype=scss.css
" The default for 'backspace' is very confusing to new users, so change it to a
" more sensible value.  Add "set backspace&" to your ~/.vimrc to reset it.
set backspace+=indent,eol,start

ino jj <ESC>
vno v <ESC>
map <C-t> :NERDTreeToggle<CR>
" Generate Docs
packloadall
silent! helptags ALL
