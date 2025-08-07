vim.pack.add({
  { src = "https://github.com/norcalli/nvim-colorizer.lua" }
})

vim.opt.termguicolors = true
require 'colorizer'.setup()
