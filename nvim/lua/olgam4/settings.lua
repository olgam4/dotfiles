vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.updatetime = 50
vim.opt.laststatus = 3

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.cmd([[ set nocompatible ]])
vim.cmd([[ set formatoptions-=o ]])

vim.cmd([[ let g:neovide_input_use_logo = v:true ]])

vim.filetype.add({ extension = { re = 'reason' } })
vim.filetype.add({ extension = { rei = 'reason' } })
