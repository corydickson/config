-- Reload plugins on save
vim.cmd [[
    augroup packer_plugins
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    use 'dracula/vim'
    use 'beikome/cosme.vim'
    use 'junegunn/seoul256.vim'
    use 'sainnhe/gruvbox-material'

    -- Awareness & Tooling
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'airblade/vim-gitgutter'
    use 'vim-utils/vim-man'
    use 'mbbill/undotree'

    -- Formatting
    use 'Yggdroot/indentLine'
    use 'elzr/vim-json'
    use 'ap/vim-css-color'
    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use 'tomlion/vim-solidity'
    use 'tpope/vim-markdown'
    use 'tbastos/vim-lua'
    use 'bronson/vim-trailing-whitespace'

    -- Search
    use 'kien/ctrlp.vim'
    use 'jremmen/vim-ripgrep'
    use 'junegunn/fzf'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- neovim
    use 'nvim-lua/completion-nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
