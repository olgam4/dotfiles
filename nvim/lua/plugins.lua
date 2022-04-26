local install_path = H.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if H.fn.empty(H.fn.glob(install_path)) > 0 then
  packer_bootstrap = H.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {
      open_on_setup = true,
      update_focused_file = {
        enable = true,
      }
    } end
  }

  use 'unblevable/quick-scope'

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'dbeniamine/cheat.sh-vim'

  use {'mg979/vim-visual-multi', branch = 'master'}

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('todo-comments').setup {} end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('plugins/nvim-treesitter').setup() end
  }

  use {
    'windwp/nvim-ts-autotag',
    config = function() require('nvim-ts-autotag').setup() end
  }

  -- tpope
  use {
    {'tpope/vim-surround'},
    {'tpope/vim-fugitive'},
    {'tpope/vim-commentary'},
    {'tpope/vim-projectionist'}, -- TODO: setup me
    {'github/copilot.vim'}
  }

  -- ThePrimeagen
  use {
    'ThePrimeagen/harpoon',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope.nvim'}},
    run = function() require("telescope").load_extension('harpoon') end
  }
  use {
    "ThePrimeagen/refactoring.nvim",  -- TODO: test me
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    },
    config = function() require("refactoring").setup({
      -- prompt for return type
      prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
      },
      -- prompt for function parameters
      prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
      },
    }) end
  }

  -- LSP, autocomplete, et cetera
  use 'sheerun/vim-polyglot'
  use {
    {'neovim/nvim-lspconfig'},
    {'williamboman/nvim-lsp-installer',
    config = function()
      require("nvim-lsp-installer").on_server_ready(function(server)
        local opts = {}
        server:setup(opts)
      end)
    end},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-vsnip'},
    {'hrsh7th/vim-vsnip'}
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


  -- GIT
  use 'airblade/vim-gitgutter' -- TODO: setup
  use 'f-person/git-blame.nvim'
  
  if packer_bootstrap then
    require('packer').sync()
  end
end)
