local mini_diff_config = {}

-- same as in defalult, but prefixed with `g` to avoid conflicts
-- with leap.nvim
local mini_surround_config = {
  mappings = {
    add = 'gsa',            -- Add surrounding in Normal and Visual modes
    delete = 'gsd',         -- Delete surrounding
    find = 'gsf',           -- Find surrounding (to the right)
    find_left = 'gsF',      -- Find surrounding (to the left)
    highlight = 'gsh',      -- Highlight surrounding
    replace = 'gsr',        -- Replace surrounding
    update_n_lines = 'gsn', -- Update `n_lines`

    suffix_last = 'l',      -- Suffix to search with "prev" method
    suffix_next = 'n',      -- Suffix to search with "next" method
  },
}

local mini_icons_config = {
  extension = {
    gleam = {
      glyph = '',
    }
  }
}

local function active_content()
  local MiniStatusline = require 'mini.statusline'
  local mode, mode_hl  = MiniStatusline.section_mode({ trunc_width = 120 })
  local git            = MiniStatusline.section_git({ trunc_width = 40 })
  local diff           = MiniStatusline.section_diff({ trunc_width = 75 })
  local diagnostics    = MiniStatusline.section_diagnostics({ trunc_width = 75 })
  local lsp            = MiniStatusline.section_lsp({ trunc_width = 75 })
  local filename       = MiniStatusline.section_filename({ trunc_width = 140 })
  local fileinfo       = MiniStatusline.section_fileinfo({ trunc_width = 120 })
  local location       = MiniStatusline.section_location({ trunc_width = 75 })
  local search         = MiniStatusline.section_searchcount({ trunc_width = 75 })
  local communism      = '☭'

  return MiniStatusline.combine_groups({
    { hl = mode_hl,                 strings = { communism, string.upper(mode) } },
    { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
    '%<', -- mark general truncate point
    { hl = 'MiniStatuslineFilename', strings = { filename } },
    '%=', -- end left alignment
    { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
    { hl = mode_hl,                  strings = { search, location } },
  })
end
local mini_statusline_config = {
  content = {
    active = active_content,
  }
}

local mini_files_config = {
  content = {
    filter = function(entry)
      return entry.name ~= '.DS_Store' and entry.name ~= '.git'
    end,
  },
  mappings = {
    go_in_plus = '<enter>',
  },
  windows = {
    preview = true,
  },
}

require 'mini.git'.setup()
require 'mini.icons'.setup(mini_icons_config)
require 'mini.diff'.setup(mini_diff_config)
require 'mini.ai'.setup()
require 'mini.surround'.setup(mini_surround_config)
require 'mini.statusline'.setup(mini_statusline_config)
require 'mini.files'.setup(mini_files_config)

--
-- MINIFILES AUTOCOMMANDS
-- these are used to set up keybindings for MiniFiles
--

vim.keymap.set({ 'n', 'v' }, '<leader>z', function()
  local MiniFiles = require 'mini.files'
  if not MiniFiles.close() then MiniFiles.open() end
end)

-- close file explorer with <esc> too
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local MiniFiles = require 'mini.files'
    local desc = 'Close'
    vim.keymap.set('n', '<esc>', MiniFiles.close, { buffer = args.data.buf_id, desc = desc })
  end,
})

-- set focused directory as current working directory
local set_cwd = function()
  local MiniFiles = require 'mini.files'
  local path = (MiniFiles.get_fs_entry() or {}).path
  if path == nil then return vim.notify('Cursor is not on valid entry') end
  vim.fn.chdir(vim.fs.dirname(path))
end

-- yank in register full path of entry under cursor
local yank_path = function()
  local MiniFiles = require 'mini.files'
  local path = (MiniFiles.get_fs_entry() or {}).path
  if path == nil then return vim.notify('Cursor is not on valid entry') end
  vim.fn.setreg(vim.v.register, path)
end

-- open path with system default handler (useful for non-text files)
local ui_open = function() vim.ui.open(require 'mini.files'.get_fs_entry().path) end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local b = args.data.buf_id
    vim.keymap.set('n', 'g~', set_cwd, { buffer = b, desc = 'Set cwd' })
    vim.keymap.set('n', 'gX', ui_open, { buffer = b, desc = 'OS open' })
    vim.keymap.set('n', 'gy', yank_path, { buffer = b, desc = 'Yank path' })
  end,
})

local map_split = function(buf_id, lhs, direction)
  local rhs = function()
    local MiniFiles = require 'mini.files'
    local cur_target = MiniFiles.get_explorer_state().target_window
    local new_target = vim.api.nvim_win_call(cur_target, function()
      vim.cmd(direction .. ' split')
      return vim.api.nvim_get_current_win()
    end)

    MiniFiles.set_target_window(new_target)
    MiniFiles.go_in()
    MiniFiles.close()
  end
  local desc = 'Split ' .. direction
  vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id
    map_split(buf_id, '<C-s>', 'belowright horizontal')
    map_split(buf_id, '<C-v>', 'belowright vertical')
    map_split(buf_id, '<C-t>', 'tab')
  end,
})
