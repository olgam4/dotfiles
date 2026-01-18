vim.opt.termguicolors = true

require('kanagawa').setup({
  overrides = function(colors)
    local theme = colors.theme
    local palette = colors.palette
    return {
      MiniDiffSignAdd = { fg = palette.carpYellow, bg = theme.ui.bg_gutter },
      MiniDiffSignChange = { fg = palette.crystalBlue, bg = theme.ui.bg_gutter },
      MiniDiffSignDelete = { fg = palette.peachRed, bg = theme.ui.bg_gutter },
      MiniDiffOverAdd = { link = "DiffAdd" },
      MiniDiffOverChange = { link = "DiffText" },
      MiniDiffOverContext = { link = "DiffChange" },
      MiniDiffOverDelete = { link = "DiffDelete" },
    }
  end,
})

vim.cmd [[ colorscheme kanagawa ]]

-- remove comments from lsp highlights
vim.api.nvim_set_hl(0, "@lsp.type.comment", {})
