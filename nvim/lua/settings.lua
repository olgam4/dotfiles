H.opt.number = true               -- show current line number
H.opt.relativenumber = true       -- show relative line numbers
H.opt.nu = true
H.opt.rnu = true
H.opt.updatetime = 50             -- accelerate refresh time of buffers
H.cmd [[ set formatoptions-=o ]]  -- TODO: find another way with only `H.opt`
H.opt.expandtab = true            -- make tabs be spaces
H.opt.tabstop = 2                 -- make tabs two spaces
H.opt.shiftwidth = 2              -- make tabs two spaces
H.opt.smarttab = true             -- make tabs two spaces
H.opt.autoindent = true           -- autoindent

H.g.gitblame_enabled = 0
