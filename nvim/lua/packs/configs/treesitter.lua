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
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
}

require 'nvim-treesitter'.install{ filetypes }

vim.filetype.add({
  extension = { dj = 'djot' }
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
