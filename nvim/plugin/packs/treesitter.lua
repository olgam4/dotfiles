vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', }
})

require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash',
    'comment',
    'css',
    'dockerfile',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'html',
    'json',
    'jsonc',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'toml',
    'vim',
    'vimdoc',
    'yaml',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

vim.filetype.add({
  extension = { dj = 'djot' }
})
