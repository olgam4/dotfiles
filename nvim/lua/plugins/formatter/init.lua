require('formatter').setup({
    logging = false,
    filetype = {
        lua = {
            function()
                return {
                    exe = 'lua-format',
                    stdin = true,
                    -- see https://github.com/Koihik/LuaFormatter for args
                    args = {'--double-quote-to-single-quote', '--column-limit=100'}
                }
            end
        }
    }
})
