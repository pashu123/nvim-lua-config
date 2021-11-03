-----------------------------------------------------------
-- Neovim github configuration file
-----------------------------------------------------------

-- Plugin: vim-fugitive
-- For using git inside nvim see --https://github.com/junegunn/fzf

-- Mappings.
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

map('n', '<leader>,f', ':BLines<CR>', default_opts)
map('n', '<C-f>', ':Files<CR>', default_opts)
map('n', '<leader>ff', ':Rg', default_opts)
map('n', '<C-g>', ':BCommits<CR>', default_opts)
map('n', '<leader>b', ':Buffers<CR>', default_opts)

