H.g.mapleader = ','
H.g.maplocalleader = '\\'

-- marks current cursor to [asdf]

H.keymap('n', 'ma', 'mA')
H.keymap('n', 'ms', 'mS')
H.keymap('n', 'md', 'mD')
H.keymap('n', 'mf', 'mF')

-- jump to marks in [asdf]
H.keymap('n', '\'a', '\'A')
H.keymap('n', '\'s', '\'S')
H.keymap('n', '\'d', '\'D')
H.keymap('n', '\'f', '\'F')

-- move through panes withouth first <c-w>
H.keymap('n', '<c-h>', '<c-w><c-h>')
H.keymap('n', '<c-j>', '<c-w><c-j>')
H.keymap('n', '<c-k>', '<c-w><c-k>')
H.keymap('n', '<c-l>', '<c-w><c-l>')

-- open panes
H.keymap('n', 'gvp', '<cmd>vsp<cr><c-w><c-l>')
H.keymap('n', 'ghp', '<cmd>sp<cr><c-w><c-j>')

-- delete withouth yankig
H.keymap('n', '<leader>d', '"_d')
H.keymap('v', '<leader>d', '"_d')

-- better indenting
H.keymap('v', '>', '>gv')
H.keymap('v', '<', '<gv')

H.keymap('n', '<leader>gs', '<cmd>Reload<cr><cmd>PackerSync<cr>',
         {silent = true})

-- remove last search highlight
H.keymap('n', '<esc>', '<cmd>noh<return><esc>', {silent = true})

-- yank to the end of the liue
H.keymap('n', 'Y', 'y$')

-- let undo go to last "poncutation"
H.keymap('i', ',', ',<c-g>u')
H.keymap('i', '.', '.<c-g>u')
H.keymap('i', '[', '[<c-g>u')
H.keymap('i', ']', ']<c-g>u')
H.keymap('i', '{', '{<c-g>u')
H.keymap('i', '}', '}<c-g>u')
H.keymap('i', '(', '(<c-g>u')
H.keymap('i', ')', ')<c-g>u')

-- open tab
H.keymap('n', 'tt', '<cmd>lua require\'shade\'.toggle()<cr><cmd>tab split<cr>')
H.keymap('n', 'tc', '<cmd>tabc<cr><cmd>lua require\'shade\'.toggle()<cr>')

require('keymappings/ls')
require('keymappings/neovide')

---------------- PLUGINS

require('keymappings/nvim-tree')
require('keymappings/vim-visual-multi')
require('keymappings/telescope')
require('keymappings/vim-fugitive')
require('keymappings/harpoon')
require('keymappings/refactoring-nvim')
require('keymappings/colorizer')
require('keymappings/minimap')
require('keymappings/formatter')
require('keymappings/twilight')
require('keymappings/git-blame')
require('keymappings/todo-comments')
require('keymappings/neuron')
require('keymappings/nvim-compe')
require('keymappings/vim-vsnip')
require('keymappings/trouble')
require('keymappings/plenary')
