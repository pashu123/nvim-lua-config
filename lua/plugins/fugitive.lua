-----------------------------------------------------------
-- Neovim github configuration file
-----------------------------------------------------------

-- Plugin: vim-fugitive
-- For using git inside nvim see --https://github.com/tpope/vim-fugitive

-- Mappings.
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

map('n', '<leader>gs', ':G<CR>', default_opts)
