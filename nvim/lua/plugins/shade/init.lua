local M = {}

function M.setup()
    require'shade'.setup({
        overlay_opacity = 50,
        opacity_step = 1,
        keys = {
            brightness_up = '<C-Up>',
            brightness_down = '<C-Down>',
            toggle = '<Leader>S'
        }
    })
end

return M
