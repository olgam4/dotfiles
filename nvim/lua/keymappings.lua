-- LEADERS
H.g.mapleader = ','
H.g.maplocalleader = '\\'

-- EASIER MARKS
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

-- PANES
-- move through panes withouth first <c-w>
H.keymap('n', '<c-h>', '<c-w><c-h>') -- TODO: fix problem between coq and this
H.keymap('n', '<c-j>', '<c-w><c-j>')
H.keymap('n', '<c-k>', '<c-w><c-k>')
H.keymap('n', '<c-l>', '<c-w><c-l>')
-- open panes
H.keymap('n', 'gvp', '<cmd>vsp<cr><c-w><c-l>')
H.keymap('n', 'ghp', '<cmd>sp<cr><c-w><c-j>')

-- TABS
-- open tab
H.keymap('n', 'tt', '<cr><cmd>tab split<cr>')
H.keymap('n', 'tc', '<cmd>tabc<cr>')

-- QUALITY OF LIFE
-- delete to null
H.keymap('n', '<leader>d', '"_d')
H.keymap('v', '<leader>d', '"_d')
-- better indenting
H.keymap('v', '>', '>gv')
H.keymap('v', '<', '<gv')
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

-- copy paste from clipboard
H.keymap('n', '<D-v>', '"*p')
H.keymap('i', '<D-v>', '<esc>"*pa')
H.keymap('v', '<D-c>', '"*y')

-- close
H.keymap('n', '<D-w>', ':wqa<cr>')

require('keymappings/lsp')
require('keymappings/custom')

-- PLUGINS
require('keymappings/nvim-tree')
require('keymappings/telescope')
require('keymappings/vim-visual-multi')
require('keymappings/todo-comments')
require('keymappings/harpoon')
require('keymappings/refactoring')
require('keymappings/git-blame')
