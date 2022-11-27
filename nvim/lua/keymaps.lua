local key = vim.keymap
-- Window Navigations
key.set('n', '<C-H>', ':wincmd h<CR>')
key.set('n', '<C-J>', ':wincmd j<CR>')
key.set('n', '<C-K>', ':wincmd k<CR>')
key.set('n', '<C-L>', ':wincmd l<CR>')
-- Buffer switching
key.set('n', '<Leader>b', ':e#<CR>')
key.set('n', '<Leader>v', ':bn<CR>')
-- Shortcuts
key.set('n', '<leader>u', ':UndotreeShow<CR>')
key.set('n', '<leader>r', ':Rg<SPACE>')
key.set('n', '<leader>p', ':FZF<CR>')
key.set('n', '<leader>gs', ':G<CR>')
key.set('n', '<leader>q', ':Sexplore<CR>')
-- Motions
key.set('i', 'jj', '<ESC>')
key.set('v', 'v', '<ESC>')
key.set('n', ';', ':')
