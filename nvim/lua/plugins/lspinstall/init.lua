local function specific_config()
    local capabilities = H.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {'documentation', 'detail', 'additionalTextEdits'}
    }

    require'lspconfig'.rust_analyzer.setup {capabilities = capabilities}
end

local function setup_lua_server()
    require'lspconfig'['lua'].setup {
        settings = {Lua = {diagnostics = {globals = {'vim', 'describe', 'it'}}}}
    }
end

local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        if server == 'lua' then
            setup_lua_server()
        else
            require'lspconfig'[server].setup {}
        end
    end
    specific_config()
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
    setup_servers() -- reload installed servers
    H.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end
