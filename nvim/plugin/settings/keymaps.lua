-- EASIER MARKS
-- marks current cursor to [asdf]
vim.keymap.set('n', 'ma', 'mA')
vim.keymap.set('n', 'ms', 'mS')
vim.keymap.set('n', 'md', 'mD')
vim.keymap.set('n', 'mf', 'mF')
-- jump to marks in [asdf]
vim.keymap.set('n', "'a", "'A")
vim.keymap.set('n', "'s", "'S")
vim.keymap.set('n', "'d", "'D")
vim.keymap.set('n', "'f", "'F")

-- PANES
-- open panes
vim.keymap.set('n', 'gvp', '<cmd>vsp<cr><c-w><c-l>')
vim.keymap.set('n', 'ghp', '<cmd>sp<cr><c-w><c-j>')

-- TABS
-- open tab
vim.keymap.set('n', '<leader>tt', '<cr><cmd>tab split<cr>')
vim.keymap.set('n', '<leader>tc', '<cmd>tabc<cr>')

-- QUALITY OF LIFE
-- delete to null
vim.keymap.set({ 'v', 'n', 'x' }, '<leader>d', "'_d")
-- better indenting
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
-- remove last search highlight
vim.keymap.set('n', '<esc>', '<cmd>noh<return><esc>')
-- yank to the end of the liue
vim.keymap.set('n', 'Y', 'y$')
-- let undo go to last 'poncutation'
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', '[', '[<c-g>u')
vim.keymap.set('i', ']', ']<c-g>u')
vim.keymap.set('i', '{', '{<c-g>u')
vim.keymap.set('i', '}', '}<c-g>u')
vim.keymap.set('i', '(', '(<c-g>u')
vim.keymap.set('i', ')', ')<c-g>u')

-- quick moving
vim.keymap.set({ 'n', 'v', 'x' }, 'J', '5j')
vim.keymap.set({ 'n', 'v', 'x' }, 'K', '5k')
-- set join keybind to another keymap
vim.keymap.set('n', '<leader>j', "mpJ'p")

-- autocomplete
vim.keymap.set('i', '<c-p>', '<c-x><c-o>')
-- use tab for menunavigation
vim.keymap.set('i', '<tab>', function()
  return vim.fn.pumvisible() == 1 and '<c-n>' or '<tab>'
end, { expr = true })
vim.keymap.set('i', '<s-tab>', function()
  return vim.fn.pumvisible() == 1 and '<c-p>' or '<s-tab>'
end, { expr = true })
vim.keymap.set('i', '<enter>', function()
  return vim.fn.pumvisible() == 1 and '<c-y>' or '<enter>'
end, { expr = true })
