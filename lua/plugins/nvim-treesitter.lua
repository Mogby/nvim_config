require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'glsl', 'json', 'lua', 'python', 'yaml' },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
  },
}
