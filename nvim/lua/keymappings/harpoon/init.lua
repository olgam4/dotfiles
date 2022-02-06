H.keymap('n', '<leader>tq', ':lua require("harpoon.term").gotoTerminal(0)<cr>', { silent = true })
H.keymap('n', '<leader>tw', ':lua require("harpoon.term").gotoTerminal(1)<cr>', { silent = true })
H.keymap('n', '<leader>te', ':lua require("harpoon.term").gotoTerminal(2)<cr>', { silent = true })
H.keymap('n', '<leader>tr', ':lua require("harpoon.term").gotoTerminal(3)<cr>', { silent = true })

H.keymap('n', '<leader>t1', ':lua require("harpoon.ui").nav_file(1)<cr>', { silent = true })
H.keymap('n', '<leader>t2', ':lua require("harpoon.ui").nav_file(2)<cr>', { silent = true })
H.keymap('n', '<leader>t3', ':lua require("harpoon.ui").nav_file(3)<cr>', { silent = true })
H.keymap('n', '<leader>t4', ':lua require("harpoon.ui").nav_file(4)<cr>', { silent = true })

H.keymap('n', '<leader>t`', ':lua require("harpoon.mark").add_file()<cr>', { silent = true })

H.keymap('n', '<leader>t~', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', { silent = true })

H.keymap('n', '<leader>marks', ':Telescope harpoon marks<cr>')
