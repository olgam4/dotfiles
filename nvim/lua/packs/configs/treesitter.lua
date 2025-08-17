require 'nvim-treesitter'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

require 'nvim-treesitter'.install {
  'bash',
  'comment',
  'css',
  'dockerfile',
  'git_config',
  'git_rebase',
  'gitattributes',
  'gitcommit',
  'gitignore',
  'gleam',
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
}

vim.filetype.add({
  extension = { dj = 'djot' }
})
