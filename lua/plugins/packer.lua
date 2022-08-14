-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme


local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }

  -- indent line
  use "lukas-reineke/indent-blankline.nvim"

  -- autopair
  use 'windwp/nvim-autopairs'

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  -- vscode like colorscheme
  use 'Mofiqul/vscode.nvim'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  -- autocomplete
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }


  -- git signs
  use 'lewis6991/gitsigns.nvim'


  --Neogit is better than fugitive.
  use 'TimUntersberger/neogit'

  --nerd commenter
  use 'preservim/nerdcommenter'

  -- telescope utils
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Dim other parts of code.
  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- git diff view of your code easier.
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- root your main project
  use 'airblade/vim-rooter'

  -- Useful for code formating.
  use 'google/vim-maktaba'
  use 'google/vim-codefmt'

  -- Git blame.  (:GitBlameToggle)
  use 'f-person/git-blame.nvim'

  -- Tmux navigator which is important

  use({
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
          -- overwrite default configuration
          -- here, e.g. to enable default bindings
          copy_sync = {
              -- enables copy sync and overwrites all register actions to
              -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
              enable = true,
          },
          navigation = {
              -- enables default keybindings (C-hjkl) for normal mode
              enable_default_keybindings = true,
          },
          resize = {
              -- enables default keybindings (A-hjkl) for normal mode
              enable_default_keybindings = true,
          }
        })
    end
  })

end)
