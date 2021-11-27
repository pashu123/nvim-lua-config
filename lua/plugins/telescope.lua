-----------------------------------------------------------
-- Neovim github configuration file
-----------------------------------------------------------


-- Telescope mappings
-- Mappings.
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

local actions = require('telescope.actions')require('telescope').setup{
  pickers = {
    buffers = {
      sort_lastused = true
    }
  }
}

map('n', '<leader>,f', ':Telescope current_buffer_fuzzy_find<CR>', default_opts)
map('n', '<C-f>', ':Telescope find_files<CR>', default_opts)
map('n', '<leader>ff', ':Telescope live_grep<CR>', default_opts)
map('n', '<C-g>', ':Telescope git_bcommits<CR>', default_opts)
map('n', '<leader>b', ':Telescope buffers<CR>', default_opts)
