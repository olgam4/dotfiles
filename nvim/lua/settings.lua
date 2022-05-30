H.opt.number = true               -- show current line number
H.opt.relativenumber = true       -- show relative line numbers
H.opt.nu = true
H.opt.rnu = true
H.opt.updatetime = 50             -- accelerate refresh time of buffers
H.opt.laststatus = 3              -- show only one status line
H.cmd [[ set formatoptions-=o ]]  -- TODO: find another way with only `H.opt`
H.opt.expandtab = true            -- make tabs be spaces
H.opt.tabstop = 2                 -- make tabs two spaces
H.opt.shiftwidth = 2              -- make tabs two spaces
H.opt.smarttab = true             -- make tabs two spaces
H.opt.autoindent = true           -- autoindent

H.cmd [[ set nocompatible ]]

H.g.gitblame_enabled = 0

-- neovide
H.cmd [[ let g:neovide_input_use_logo = v:true ]]
