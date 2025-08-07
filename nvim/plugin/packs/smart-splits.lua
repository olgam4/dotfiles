vim.pack.add({
  { src = 'https://github.com/mrjones2014/smart-splits.nvim' },
  -- TODO until nvim 0.12 is released and lets us run build commands,
  -- we need to manually run './kitty/install-kittens.bash' in the install repo
})

-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<a-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<a-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<a-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<a-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<c-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<c-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<c-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<c-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<c-m>', require('smart-splits').move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
