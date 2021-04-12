syntax on

set hidden
set showcmd
set showmatch
set showmode
set nohlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set relativenumber
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set undolevels=10000 "default 1000
set incsearch
set ignorecase
set smartcase
set updatetime=50
set encoding=utf-8
set termguicolors
set splitbelow splitright
set foldmethod=syntax
set nofoldenable

" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'dracula/vim'
Plug 'beikome/cosme.vim'
Plug 'junegunn/seoul256.vim'

" Awareness & Tooling
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'lyuts/vim-rtags'
Plug 'vim-utils/vim-man'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Formatting
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'elzr/vim-json'
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-markdown'
Plug 'bronson/vim-trailing-whitespace'

" Search
Plug 'kien/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'

call plug#end()

" Themes
syntax enable
filetype plugin indent on
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

" Window Navigations
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Buffer switching
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" Shortcuts
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>r :Rg<SPACE>
nnoremap <leader>g :Goyo<CR>
ino jj <ESC>
vno v <ESC>
noremap ; :

" Searching
set wildignore+=*node_modules*

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Goyo focus
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 200
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" React Typescript Awareness
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
" dark red
hi tsxTagName guifg=#E06C75
" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
hi tsxAttrib guifg=#F8BD7F cterm=italic
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666

" Generate Docs
packloadall
silent! helptags ALL
