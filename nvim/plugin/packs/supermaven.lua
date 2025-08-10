vim.pack.add({ {
  src = 'https://github.com/supermaven-inc/supermaven-nvim',
} })

require 'supermaven-nvim'.setup {
  keymaps = {
    accept_suggestion = "<s-enter>",
    accept_word = "<c-w>",
  },
  disable_keymaps = false,
}
