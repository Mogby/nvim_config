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
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Lsp plugins
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  -- Formatter
  use 'psf/black'

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

  -- Commenter
  use 'numToStr/Comment.nvim'

  -- Copy-paste between vim and system clipboard
  use { 'ojroques/nvim-osc52' }

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

  -- Copilot
  use { "github/copilot.vim" }
end)

require('plugins/black')
require('Comment').setup()
require('plugins/cmp')
require('plugins/lualine')
require('mason').setup()
require('mason-lspconfig').setup()
require('plugins/nvim-osc52')
require("nvim-tree").setup {}
require('plugins/nvim-treesitter')
require('plugins/telescope')
