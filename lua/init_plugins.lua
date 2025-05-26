local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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
    'mason-org/mason.nvim',
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

  -- Colorscheme
  use 'michalbachowski/vim-wombat256mod'

  -- Status line
  use 'nvim-lualine/lualine.nvim'

  -- OSC52 support
  use { 'ojroques/nvim-osc52' }

  -- Very powerful text search
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }

  -- Git integration
  use {
    'NeogitOrg/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true,
  }
  use { 'lewis6991/gitsigns.nvim' }
end)

require('mason').setup()

require('plugins/black')

require('plugins/cmp')

require('Comment').setup()

vim.cmd 'colorscheme wombat256mod'

require('plugins/lualine')

require('plugins/nvim-osc52')

require('plugins/nvim-treesitter')
require('plugins/telescope')

require('nvim-tree').setup()

require('neogit').setup()
require('plugins/gitsigns')
