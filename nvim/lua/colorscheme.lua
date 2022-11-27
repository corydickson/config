--TODO: remove vimscript
vim.cmd [[
    syntax enable
    filetype plugin indent on
    colorscheme seoul256

    if !has('gui_running')
        hi! Normal ctermbg=NONE guibg=NONE
        hi! NonText ctermbg=NONE guibg=NONE
    endif

    " set filetypes as typescript.tsx
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

    " Airline config
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
]]
