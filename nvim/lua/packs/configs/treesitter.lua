local filetypes = {
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
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
}

require 'nvim-treesitter'.install{ filetypes }

vim.filetype.add({
  extension = {
    dj = 'djot',
    ghtml = 'ghtml',
    tsrx = 'tsx',
  }
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    local ft = vim.bo.filetype
    for _, filetype in ipairs(filetypes) do
      if filetype == ft then
        vim.treesitter.start()
      end
    end
  end,
})

-- ghtml: use custom tree-sitter parser with Gleam + HTML injections
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'ghtml',
  callback = function()
    vim.treesitter.start(0, 'ghtml')
    vim.bo.commentstring = '<!-- %s -->'
  end,
})
