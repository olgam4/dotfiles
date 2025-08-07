-- USER COMMANDS
vim.api.nvim_create_user_command('LspInfo', function()
  vim.api.nvim_command('checkhealth vim.lsp')
end, {})

-- AUTOCOMMANDS
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove("o")
  end,
})
