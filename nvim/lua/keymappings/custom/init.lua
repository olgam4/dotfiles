function _G.git_commit()
    local message = H.fn.input("Commit message: ")
    H.fn.execute('! git add -A')
    H.fn.execute("! git commit -m \"" .. message .. "\"")
    -- H.fn.execute('! git push')
end

H.keymap('n', 'gcp', ':lua git_commit()<cr>', { silent = true })

function _G.increase_font_size()
    local font = H.api.nvim_get_option('guifont')
    local size = string.match(font, ':h(%d+)')
    if size then
        local newSize = tonumber(size) + 1
        change_font_size(newSize)
    end
end

function _G.decrease_font_size()
    local font = H.api.nvim_get_option('guifont')
    local size = string.match(font, ':h(%d+)')
    if size then
        local newSize = tonumber(size) - 1
        change_font_size(newSize)
    end
end

function _G.change_font_size(size)
    local font = H.api.nvim_get_option('guifont')
    local newFont = string.gsub(font, ':h%d+', ':h' .. size)
    H.api.nvim_set_option('guifont', newFont)
end

H.keymap('n', '+', ':lua increase_font_size()<cr>', { silent = true })
H.keymap('n', '-', ':lua decrease_font_size()<cr>', { silent = true })

