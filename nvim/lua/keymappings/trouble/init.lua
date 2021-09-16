H.keymap('n', '<leader>xx', '<cmd>Trouble<cr>', {silent = true})
H.keymap('n', '<leader>xw', '<cmd>Trouble lsp_workspace_diagnostics<cr>',
         {silent = true})
H.keymap('n', '<leader>xd', '<cmd>Trouble lsp_document_diagnostics<cr>',
         {silent = true})
H.keymap('n', '<leader>xl', '<cmd>Trouble loclist<cr>', {silent = true})
H.keymap('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', {silent = true})
H.keymap('n', 'gR', '<cmd>Trouble lsp_references<cr>', {silent = true})
