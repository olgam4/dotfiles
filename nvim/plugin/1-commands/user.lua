vim.api.nvim_create_user_command('LspInfo', function()
  vim.api.nvim_command('checkhealth vim.lsp')
end, {})

