local system = require("utils.system")

if not system.is_executable("clangd") then return end

local lspconfig = require("lspconfig")

lspconfig["clangd"].setup({
  cmd = { "clangd", "--offset-encoding=utf-16" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})
