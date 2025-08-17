local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>o', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>m', builtin.marks, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope oldfiles' })
vim.keymap.set('n', '<leader>km', builtin.keymaps, { desc = 'Telescope marks' })
vim.keymap.set('n', '<leader>cv', builtin.registers, { desc = 'Telescope marks' })
