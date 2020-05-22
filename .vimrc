syntax on

set hidden
set showcmd
set showmatch
set showmode
set hlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set number
set nu
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set undolevels=10000 "default 1000
set incsearch
set ignorecase
set smartcase
set updatetime=50

" Plugins
call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'dracula/vim'
Plug 'beikome/cosme.vim'
Plug 'junegunn/seoul256.vim'

" Awareness & Tooling
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jremmen/vim-ripgrep'
Plug 'airblade/vim-gitgutter'
Plug 'lyuts/vim-rtags'
Plug 'tomlion/vim-solidity'
Plug 'vim-utils/vim-man'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ap/vim-css-color'

call plug#end()

" Themes
syntax enable
colorscheme seoul256
set background=dark
if !has('gui_running')
    hi! Normal ctermbg=NONE guibg=NONE
    hi! NonText ctermbg=NONE guibg=NONE
endif

" PluginConfigs
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "

let g:ctrlp_use_caching = 0

" Mappings
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>g :Goyo<CR>
ino jj <ESC>
vno v <ESC>
noremap ; :

" Searching
set wildignore+=*node_modules*

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 200
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Generate Docs
packloadall
silent! helptags ALL
