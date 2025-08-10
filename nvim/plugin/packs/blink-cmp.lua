vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp' }
  -- TODO until nvim 0.12 is released and lets us run build commands,
  -- we need to manually run 'cargo +nightly build --release' in the install repo
})

require 'blink.cmp'.setup({
  signature = { enabled = true },
  completion = {
    documentation = {
      auto_show = true,
    }
  },
  keymap = {
    preset = 'none',
    ['<s-tab>'] = { 'select_prev', 'fallback' },
    ['<tab>'] = { 'select_next', 'fallback' },
    ['<cr>'] = { 'accept', 'fallback' },
  }
})
