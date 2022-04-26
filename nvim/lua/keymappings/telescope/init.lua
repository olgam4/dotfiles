H.keymap('n', '<leader>o', '<cmd>Telescope find_files<cr>')
H.keymap('n', '<leader>f', '<cmd>Telescope live_grep<cr>')

H.keymap('n', '<space>d', '<cmd>Telescope lsp_definitions<cr>')
H.keymap('n', '<space>r', '<cmd>Telescope lsp_references<cr>')

H.keymap('n', '<leader>gc', '<cmd>lua require\'telescope.builtin\'.git_commits{}<cr>')
H.keymap('n', '<leader>km', '<cmd>lua require\'telescope.builtin\'.keymaps{}<cr>')
H.keymap('n', '<leader>vr', '<cmd>lua require\'telescope.builtin\'.registers{}<cr>')
