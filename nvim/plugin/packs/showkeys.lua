vim.pack.add({
  { src = 'https://github.com/NvChad/showkeys', opt = true },
})

require "showkeys".setup({ position = "top-right" })

vim.keymap.set('n', '<leader>sk', '<cmd>ShowkeysToggle<cr>', { silent = true })
