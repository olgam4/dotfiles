local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

H.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

H.cmd [[
  let g:coq_settings = { 'auto_start': 'shut-up' }
]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require 'nvim-tree'.setup {
      open_on_setup = true,
      update_focused_file = {
        enable = true,
      },
      diagnostics = {
        enable = true,
      }
    }
    end,
    tag = 'nightly',
  }

  -- dancing around
  use 'wellle/targets.vim'
  use 'ggandor/lightspeed.nvim'

  use 'tjdevries/train.nvim'

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use 'dbeniamine/cheat.sh-vim'

  use { 'mg979/vim-visual-multi', branch = 'master' }

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('todo-comments').setup {} end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = 'all',
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        indent = { enable = true },
      }
    end
  }

  -- tpope
  use {
    { 'tpope/vim-surround' },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-commentary' },
    { 'tpope/vim-projectionist' }, -- TODO: setup me
    {
      'github/copilot.vim',
      config = function ()
          local node_path = "~/.nvm/versions/node/v17.9.0/bin/node";
          vim.g['copilot_node_command'] = node_path;
      end
    }
  }

  -- ThePrimeagen
  use {
    'ThePrimeagen/harpoon',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope.nvim' } },
    run = function() require("telescope").load_extension('harpoon') end
  }
  use {
    "ThePrimeagen/refactoring.nvim", -- TODO: test me
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function() require'refactoring'.setup {}
    end
  }

  -- LSP, autocomplete, et cetera
  use {
    { 'williamboman/nvim-lsp-installer',
      config = function()
        require("nvim-lsp-installer").setup {}
      end },
    { 'neovim/nvim-lspconfig',
      config = function()
        require('nvim-lsp-installer').setup {}
        local lspconfig = require('lspconfig')
        lspconfig.sumneko_lua.setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = {'vim', 'use' }
              },
            },
          },
        }
        lspconfig.tsserver.setup {
            root_dir = lspconfig.util.root_pattern("package.json"),
        }
        lspconfig.denols.setup {
            root_dir = lspconfig.util.root_pattern("deno.json"),
        }
        lspconfig.tailwindcss.setup {}
        lspconfig.astro.setup {}
        lspconfig.bashls.setup {}
        lspconfig.rust_analyzer.setup {}
        lspconfig.emmet_ls.setup {
          filetypes = { 'html', 'tsx', 'jsx', 'typescriptreact', 'typescript' },
        }
      end },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp',
      config = function()
        local cmp = require('cmp')
        cmp.setup({
          sorting = {
            comparators = {
              cmp.config.compare.offset,
              cmp.config.compare.exact,
              cmp.config.compare.score,
              cmp.config.compare.sort_text,
              cmp.config.compare.order,
            }
          },
          mapping = {
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ["`"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              else
                fallback()
              end
            end, { "i", "s" }),

            ["~"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              else
                fallback()
              end
            end, { "i", "s" }),
          },
        })
      end
    },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
    { 'ray-x/lsp_signature.nvim' },
    { 'lewis6991/spellsitter.nvim',
      config = function ()
        require'spellsitter'.setup {
          enable = true,
        }
      end
    },
  }

  -- THEMES
  use 'ryanoasis/vim-devicons'
  use {
    'NTBBloodbath/galaxyline.nvim',
    config = function()
      require('themes/galaxyline')
    end
  }
  use 'megantiu/true.vim'
  use 'ray-x/aurora'
  use 'rebelot/kanagawa.nvim'
  use {
    'goolord/alpha-nvim',
    config = function()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }
  use {
    'rcarriga/nvim-notify',
    config = function ()
      vim.notify = require('notify')
    end
  }

  -- GIT
  use 'airblade/vim-gitgutter' -- TODO: setup
  use 'f-person/git-blame.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
