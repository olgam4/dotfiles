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
          'nvim-tree/nvim-tree.lua',
          dependencies = 'nvim-tree/nvim-web-devicons',
          tag = 'nightly',
          config = function()
               vim.g.loaded_netrw = 1
               vim.g.loaded_netrwPlugin = 1
               require('nvim-tree').setup({
                    update_focused_file = {
                         enable = true,
                    },
               })
          end,
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
     { 'github/copilot.vim' },

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
               require('harpoon'):setup({})
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
          'jay-babu/mason-null-ls.nvim',
          'neovim/nvim-lspconfig',
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          'hrsh7th/nvim-cmp',

          'hrsh7th/cmp-vsnip',
          'hrsh7th/vim-vsnip',
     },

     {
          'nvimtools/none-ls.nvim',
          dependencies = 'nvim-lua/plenary.nvim',
          config = function()
               local null_ls = require('null-ls')
               null_ls.setup({
                    sources = {
                         null_ls.builtins.formatting.stylua,
                         null_ls.builtins.diagnostics.eslint,
                         null_ls.builtins.completion.spell,
                         null_ls.builtins.formatting.prettier,
                         null_ls.builtins.formatting.eslint,
                    },
               })
          end,
     },
})

require('mason').setup()
require('mason-lspconfig').setup()
