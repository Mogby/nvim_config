vim.cmd [[packadd packer.nvim]]

local use = require('packer').use
require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Lsp plugins
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Snippets engine
  use 'SirVer/ultisnips'

  -- Large collection of different snippets
  use 'honza/vim-snippets'

  -- Autocompletion plugins
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- Colorscheme
  use 'michalbachowski/vim-wombat256mod'

  -- Status line
  use 'nvim-lualine/lualine.nvim'

  -- Very powerful text search
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use({ "ojroques/vim-oscyank" }) -- yank into system clipboard
end)

require('plugins/cmp')
require('plugins/lualine')
require('plugins/nvim-lsp-installer')
require('plugins/nvim-tree')
require('plugins/nvim-treesitter')
require('plugins/telescope')

-- always yank into system clipboard
vim.cmd([[
  autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif
]])
