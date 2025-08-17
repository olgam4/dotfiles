local ls = require 'luasnip'
local loaders = require 'luasnip.loaders.from_lua'

ls.setup({
  keep_roots = true,
  link_roots = true,
  link_children = true,
  exit_roots = false,
  update_events = 'TextChanged,TextChangedI',
  delete_check_events = "TextChanged",
  enable_autosnippets = true,
})
loaders.load({ paths = "./snippets/" })

vim.keymap.set({ 'i', 's' }, '<c-e>', function()
  if ls.expandable() then
    ls.expand()
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-h>', function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, { silent = true })
