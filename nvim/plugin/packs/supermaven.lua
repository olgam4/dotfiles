vim.pack.add({ {
  src = 'https://github.com/supermaven-inc/supermaven-nvim',
} })

require 'supermaven-nvim'.setup {
  keymaps = {
    accept_suggestion = "<s-enter>",
    accept_word = "<c-j>",
  },
  disable_keymaps = false, -- disables built in keymaps for more manual control
}
