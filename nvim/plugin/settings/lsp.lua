vim.lsp.enable({ "lua_ls", "gleam", "bash_ls", "cssls", "jsonls", "superhtml", "css_variables", "cssmodules_ls",
  "postgres_lsp", "ts_ls" })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.keymap.set('n', '<space>,', function()
      vim.diagnostic.jump({ count = 1 })
    end)
    vim.keymap.set('n', '<space>.', function()
      vim.diagnostic.jump({ count = -1 })
    end)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<space>Dc', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<space>d', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<space>h', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<space>i', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>m', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>a', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>r', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
