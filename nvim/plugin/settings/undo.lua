local undodir = vim.fn.expand("~/.vim/undodir")

vim.opt.undofile = true
vim.opt.undodir = undodir

if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
