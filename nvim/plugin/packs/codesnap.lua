vim.pack.add({ {
  src = 'https://github.com/mistricky/codesnap.nvim',
  -- TODO until nvim 0.12 is released and lets us run build commands,
  -- we need to manually run 'make' in the install repo
} })

require 'codesnap'.setup {
  code_font_family = 'Liga Hasklug Nerd Font Mono',
  watermark = "",
  has_breadcrumbs = true,
}
