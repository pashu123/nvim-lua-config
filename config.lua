-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--
--
lvim.colorscheme = "lunar"

lvim.format_on_save.enabled = false

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "black", filetypes = { "python" } },
  -- other formatters for other languages go in this list
})


vim.opt_local.wrap = true
vim.api.nvim_set_keymap('v', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

vim.g.editorconfig = false

lvim.builtin.telescope.pickers.buffers.sort_mru = true
lvim.builtin.telescope.pickers.buffers.ignore_current_buffer = true
