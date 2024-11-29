require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

vim.filetype.add({
  extension = { dj = 'djot' }
})
