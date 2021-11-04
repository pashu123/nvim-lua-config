-----------------------------------------------------------
-- Neovim github configuration file
-----------------------------------------------------------

-- Plugin: vim-fugitive
-- For using git inside nvim see --https://github.com/junegunn/fzf

-- Mappings.
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

map('n', '<leader>,f', ':FzfLua blines<CR>', default_opts)
map('n', '<C-f>', ':FzfLua files<CR>', default_opts)
map('n', '<leader>ff', ':FzfLua live_grep<CR>', default_opts)
map('n', '<C-g>', ':FzfLua git_bcommits<CR>', default_opts)
map('n', '<leader>b', ':FzfLua buffers<CR>', default_opts)
