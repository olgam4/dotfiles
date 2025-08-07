vim.pack.add({{
  src = 'https://github.com/nvim-telescope/telescope.nvim',
}})

vim.keymap.set('n', '<leader>o', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>m', '<cmd>Telescope marks<cr>')
vim.keymap.set('n', '<space>d', '<cmd>Telescope lsp_definitions<cr>')
vim.keymap.set('n', '<space>r', '<cmd>Telescope lsp_references<cr>')
vim.keymap.set('n', '<leader>gc', "<cmd>lua require'telescope.builtin'.git_commits{}<cr>")
vim.keymap.set('n', '<leader>km', "<cmd>lua require'telescope.builtin'.keymaps{}<cr>")
vim.keymap.set('n', '<leader>cv', "<cmd>lua require'telescope.builtin'.registers{}<cr>")
