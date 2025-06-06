local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'echasnovski/mini.ai', version = false,
    config = function()
      require('mini.ai').setup()
    end
  },

  {
    "mistricky/codesnap.nvim",
    build = "make",
    config = function()
      require("codesnap").setup {
        code_font_family = 'Liga Hasklug Nerd Font Mono',
        watermark = "",
        has_breadcrumbs = true,
      }
    end
  },

  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {
        override = {
          gleam = {
            icon = '',
            color = '#ffaff3',
            cterm_color = '219',
            name = 'Gleam',
          }
        }
      }
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate"
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },

  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup({})
    end,
  },
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup({})
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({})
    end,
  },

  -- tpope, our god and saviour
  { 'tpope/vim-surround' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-commentary' },
  { 'tpope/vim-projectionist' }, -- TODO: setup me
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.keymap.set('i', '<s-enter>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('n', '<leader>c', function() return vim.fn['codeium#Chat']() end,
        { expr = true, silent = true })
    end,
  },

  {
    'stevearc/oil.nvim',
    dependencies = { { "echasnovski/mini.icons" } },
    config = function()
      require('oil').setup({
        default_file_explorer = true,
      })
    end
  },

  -- dancing around
  'wellle/targets.vim',
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('harpoon'):setup({
        terms = {}, -- create a terms list to have terminal support
      })
    end,
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  -- themes
  'rebelot/kanagawa.nvim',

  {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  },
})
