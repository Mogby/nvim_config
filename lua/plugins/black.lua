local g = vim.g                 -- global variables

g.black_linelength = 120
g.black_skip_string_normalization = true
g.black_quiet = true

vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern='*.py',
  callback=function()
    vim.cmd('Black')
  end
})
