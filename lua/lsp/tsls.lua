local system = require("utils.system")

if not system.is_executable("typescript-language-server") then return end
local lspconfig = require("lspconfig")
lspconfig["ts_ls"].setup({})
