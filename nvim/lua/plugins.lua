local install_path = H.fn.stdpath('data') ..
                         '/site/pack/packer/start/packer.nvim'

if H.fn.empty(H.fn.glob(install_path)) > 0 then
    H.fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    H.execute 'packadd packer.nvim'
end

H.cmd [[packadd packer.nvim]]
-- autocompile on save
H.cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]

-- TODO: move to a file
H.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

-- TODO: use better setups and uniformize
-- TODO: organize better
-- TODO: lazy load
-- TODO: autoinstall on Reload
return require('packer').startup(function(use)
    -- Packer can manage itself
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

    use 'kyazdani42/nvim-web-devicons'

    use 'andweeb/presence.nvim'

   use 'unblevable/quick-scope'

    use {
        'norcalli/nvim-colorizer.lua',
        run = function() require('plugins/colorizer').setup() end
    }

    use 'wfxr/minimap.vim'

    use 'dbeniamine/cheat.sh-vim'

    use {
        'corani/neuron.nvim', -- TODO: until main fixes it
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope.nvim'}
        },
        branch = 'corani_fixes',
        config = function() require('plugins/neuron').setup() end
    }

    use {'NFrid/due.nvim', config = function() require('due_nvim').setup {} end}

    use {
        'iamcco/markdown-preview.nvim',
        run = function() require('plugins/markdown-preview').setup() end
    }
    use {
        'famiu/nvim-reload',
        cmd = {'Reload', 'Restart'},
        config = function() H.cmd [[packadd plenary.nvim]] end
    }

    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use {'mg979/vim-visual-multi', branch = 'master'}

    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('todo-comments').setup {} end
    }

    use {
        'windwp/nvim-ts-autotag',
        config = function() require('nvim-ts-autotag').setup() end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('plugins/nvim-treesitter').setup() end
    }
    use {
        'nvim-treesitter/playground',
        run = function()
            require('plugins/nvim-treesitter-playground').setup()
        end
    }

    use 'haringsrob/nvim_context_vt'

    -- tpope
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'tpope/vim-projectionist'

    -- ThePrimeagen
    use {
        'ThePrimeagen/harpoon',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'ThePrimeagen/refactoring.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'}, {'nvim-treesitter/nvim-treesitter'}
        },
        config = function() require('plugins/refactoring-nvim').setup() end
    }

    -- LSP, autocomplete etc.
    use {
        'hrsh7th/nvim-compe',
        config = function() require('plugins/nvim-compe').setup() end
    }
    use 'neovim/nvim-lspconfig'
    use {
        'kabouzeid/nvim-lspinstall',
        config = function() require('plugins/lspinstall') end
    }
    use {
        'ray-x/lsp_signature.nvim',
        config = function() require'lsp_signature'.setup() end
    }
    use {
        'mhartington/formatter.nvim',
        config = function() require('plugins/formatter') end
    }
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'rafamadriz/friendly-snippets'
    use {'kosayoda/nvim-lightbulb', run = function() end}
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('trouble').setup {} end
    }

    -- THEMES
    -- Devicons, also install https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/Regular
    use 'ryanoasis/vim-devicons'
    use 'megantiu/true.vim'
    use 'Rigellute/shades-of-purple.vim'
    use {
      'pineapplegiant/spaceduck',
      branch = 'main'
    }
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
    }
    use 'luochen1990/rainbow'
    use {
        'folke/twilight.nvim',
        config = function() require('twilight').setup {} end
    }
    use {
        'sunjon/Shade.nvim',
        config = function() require'plugins/shade'.setup() end
    }

    -- GIT
    use 'airblade/vim-gitgutter'
    use 'f-person/git-blame.nvim'
end)
