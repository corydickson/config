"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/cory.dickson/.local/share/dein//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/cory.dickson/.local/share/dein/')
  call dein#begin('/Users/cory.dickson/.local/share/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/cory.dickson/.local/share/dein//repos/github.com/Shougo/dein.vim')

  call dein#add('hail2u/vim-css3-syntax', {'on_ft':['css','scss']})
  call dein#add('elzr/vim-json', {'on_ft': 'json'})
  call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
  call dein#add('tomlion/vim-solidity')
  call dein#add('othree/yajs.vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('Raimondi/delimitMate', {'on_ft': ['javascript', 'typescript', 'css', 'scss']})
  call dein#add('valloric/MatchTagAlways', {'on_ft': 'html'})
  call dein#add('tpope/vim-fugitive')
  call dein#add('mhinz/vim-signify')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('tpope/vim-repeat')
  call dein#add('scrooloose/syntastic')
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-surround')
  call dein#add('Chiel92/vim-autoformat')
  call dein#add('ap/vim-css-color')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('itspriddle/vim-jquery')
  call dein#add('cakebaker/scss-syntax.vim')
  call dein#add('townk/vim-autoclose')
  call dein#add('Shougo/Denite.nvim')
  call dein#add('junegunn/goyo.vim')
  call dein#add('junegunn/limelight.vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('peitalin/vim-jsx-typescript')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell')

  " AWARENESS
  " status line
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " git status in NERDTree
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  " git status in gutter
  call dein#add('airblade/vim-gitgutter')

  " COLORSCHEMES
  call dein#add('junegunn/seoul256.vim')
  call dein#add('flrnprz/candid.vim')

  " FILE SYSTEM
  call dein#add('scrooloose/nerdtree')

  " LINTING
  call dein#add('neomake/neomake')

  " SEARCHING
  call dein#add('mhinz/vim-grepper')

  call dein#add('ryanoasis/vim-devicons')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


" PREFERENCES
set hlsearch
set number
set nu
set relativenumber
set showcmd
set showmatch
set showmode
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
inoremap jj <ESC>
noremap ; :
"       ^^^aka win
set undodir=~/.local/share/nvim/undoes
set undolevels=10000 "default 1000
autocmd InsertChange,InsertLeave,TextCHanged * update | Neomake

"dev icons config

set guifont=Knack\ Regular\ Nerd\ Font\ Complete:h12
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Knack\ Regular\ Nerd\ Font\ Complete:h12
   endif
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" AWARENESS
" linting
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_verbose=3 " <<< for debugging <<<
" disaster zone (airline stuff)
" git status

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
map <C-n> :NERDTreeToggle<CR>

" SEARCHING
" nnoremap <leader>a :Grepper
set wildignore+=*node_modules*

" COLOR SCHEMES
set termguicolors
" set background=light
set background=dark
" Unified color scheme (default: dark)
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
" let g:seoul256_background = 236
" colo seoul256
syntax on
colo candid


" NERDTree on left
let g:NERDTreeWinPos = 'left'

" React configurations
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"let g:syntastic_javascript_checkers = ['eslint']
"let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
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

set splitbelow splitright

