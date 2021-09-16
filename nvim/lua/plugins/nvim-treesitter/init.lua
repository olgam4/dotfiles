local function setup()
    H.cmd [[ <cmd>TSUpdate ]]
    H.cmd [[ <cmd>TSInstall maintained ]]
end

local M = {}

M.setup = setup

return M
