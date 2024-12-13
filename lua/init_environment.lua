local cmd = vim.cmd            -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local map = vim.api.nvim_set_keymap
local g = vim.g                -- global variables
local opt = vim.opt            -- global/buffer/windows-scoped options

--

g.python3_host_prog = "~/.config/nvim/.venv/bin/python"

-- Language

cmd("language en_US")

-- Key bindings

g.mapleader = ' '

map('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>', {})
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {})
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {})
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {})
map('n', '<leader>tt', '<cmd>Telescope<cr>', {})

map('n', '<F2>', '<cmd>NvimTreeToggle<cr>', {})
map('n', '<leader>fr', '<cmd>NvimTreeFindFile<cr>', {})

map('n', '<leader>pp', '<cmd>set paste<cr>', {})
map('n', '<leader>np', '<cmd>set nopaste<cr>', {})

-- Various settings

opt.mouse = 'a'

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true

-- Recognize GLSL filetypes

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.vert', '*.tesc', '*.tese', '*.glsl', '*.geom', '*.frag', '*.comp', '*.rgen', '*.rmiss', '*.rchit', '*.rahit', '*.rint', '*.rcall' },
  command = 'set filetype=glsl'
})
