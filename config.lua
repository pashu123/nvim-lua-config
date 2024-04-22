-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
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


-- Clangd specific settings.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

local clangd_flags = {
  "--fallback-style=google",
  "--background-index",
  "-j=12",
  "--all-scopes-completion",
  "--pch-storage=disk",
  "--clang-tidy",
  "--log=error",
  "--completion-style=detailed",
  "--header-insertion=iwyu",
  "--header-insertion-decorators",
  "--enable-config",
  "--offset-encoding=utf-16",
  "--ranking-model=heuristics",
  "--folding-ranges",
}

local clangd_bin = "clangd"

local opts = {
  cmd = { clangd_bin, unpack(clangd_flags) },
}
require("lvim.lsp.manager").setup("clangd", opts)


-- Change it to point to iree-mlir-lsp-server.
-- Has support to more dialects and operations.
local mlir_options = {
  cmd = { "iree-mlir-lsp-server" },
}
require("lvim.lsp.manager").setup("mlir_lsp_server", mlir_options)
require("lvim.lsp.manager").setup("tblgen_lsp_server")
require("lvim.lsp.manager").setup("mlir_pdll_lsp_server")


-- Add the mlir filetype.
vim.cmd [[ autocmd BufRead,BufNewFile *.mlir set filetype=mlir ]]

-- Add the new required plugins.
lvim.plugins = {
  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter",
    config = function()
      vim.g.tmux_navigator_no_mappings = 0
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()   -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  }
}

-- Search in the current buffer.
lvim.builtin.which_key.mappings["t"] = {
  "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Current buffer fuzzy."
}

-- Renames the symbol under the cursor. ALso, renames the references.
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

-- Awesome floating terminal.
lvim.builtin.terminal.open_mapping = "<c-t>"
