vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },

  { src = 'https://github.com/ggandor/leap.nvim' },

  { src = 'https://github.com/mistricky/codesnap.nvim' },
  -- TODO until nvim 0.12 is released and lets us run build commands,
  -- we need to manually run 'make' in the install repo

  { src = "https://github.com/norcalli/nvim-colorizer.lua" },

  { src = 'https://github.com/L3MON4D3/LuaSnip' },

  { src = 'https://github.com/williamboman/mason.nvim' },

  { src = 'https://github.com/NvChad/showkeys',                 opt = true },

  { src = 'https://github.com/mrjones2014/smart-splits.nvim' },
  -- TODO until nvim 0.12 is released and lets us run build commands,
  -- we need to manually run './kitty/install-kittens.bash' in the install repo

  { src = 'https://github.com/supermaven-inc/supermaven-nvim' },

  { src = 'https://github.com/rebelot/kanagawa.nvim' },

  { src = 'https://github.com/saghen/blink.cmp' },
  -- TODO until nvim 0.12 is released and lets us run build commands,
  -- we need to manually run 'cargo +nightly build --release' in the install repo

  { src = 'https://github.com/echasnovski/mini-git' },
  { src = 'https://github.com/echasnovski/mini.diff' },
  { src = 'https://github.com/echasnovski/mini.icons' },
  { src = 'https://github.com/echasnovski/mini.ai' },
  { src = 'https://github.com/echasnovski/mini.files' },
  { src = 'https://github.com/echasnovski/mini.surround' },
  { src = 'https://github.com/echasnovski/mini.statusline' },

  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
})

--
-- LEAP CONFIG
--

require 'leap'.add_default_mappings()

--
-- BLINK CONFIG
--

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

--
-- CODESNAP CONFIG
--

require 'codesnap'.setup {
  code_font_family = 'Liga Hasklug Nerd Font Mono',
  watermark = "",
  has_breadcrumbs = true,
}

--
-- COLORIZER CONFIG
--

vim.opt.termguicolors = true
require 'colorizer'.setup()

--
-- SHOWKEYS CONFIG
--
require "showkeys".setup({ position = "top-right" })

vim.keymap.set('n', '<leader>sk', '<cmd>ShowkeysToggle<cr>', { silent = true })

--
-- MASON CONFIG
--

require 'mason'.setup()

--
-- SUPERMAVEN CONFIG
--

require 'supermaven-nvim'.setup {
  keymaps = {
    accept_suggestion = "<s-enter>",
    accept_word = "<c-w>",
  },
  disable_keymaps = false,
}

require 'packs.configs.treesitter'
require 'packs.configs.luasnip'
require 'packs.configs.mini'
require 'packs.configs.telescope'
require 'packs.configs.smart-splits'
