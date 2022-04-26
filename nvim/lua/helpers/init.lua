local M = {}

M.cmd = vim.cmd
M.opt = vim.opt
M.fn = vim.fn
M.g = vim.g
M.execute = vim.api.nvim_command
M.lsp = vim.lsp
M.api = vim.api

function M.is_buffer_empty() return vim.fn.empty(vim.fn.expand('%:t')) == 1 end

function M.has_width_gt(cols) return vim.fn.winwidth(0) / 2 > cols end

function M.keymap(mode, new_keymap, command, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, new_keymap, command, options)
end

function M.dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. M.dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

return M
