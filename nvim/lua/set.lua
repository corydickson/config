local set = vim.opt
local g = vim.g

g.mapleader = " "

set.hidden = true
set.showcmd = true
set.showmatch = true
set.showmode = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true
set.number = true
set.relativenumber = true
set.undodir = vim.env.HOME .. '/.config/nvim/undodir'
set.undofile = true
set.undolevels = 10000
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.updatetime = 50
set.encoding = 'utf-8'
set.termguicolors = true
set.splitbelow = true
set.splitright = true
set.foldmethod = 'syntax'
set.background = 'dark'

-- TODO: provide a way to add wildcards more easily
set.wildignore = "*node_modules*"

-- Plugin Settings
g.rg_derive_root='true'
g.ctrlp_use_caching = 0
g.ctrlp_working_path_mode = 'ra'

vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
