local system = require("utils.system")
local autocmd = require("utils.autocmd")

if not system.is_executable("glsl_analyzer") then return end
local lspconfig = require("lspconfig")
lspconfig["glsl_analyzer"].setup({
  cmd = { "glsl_analyzer" },
  filetypes = { "glsl", "vert", "tesc", "tese", "frag", "geom", "comp" },
  single_file_support = true,
})

autocmd.auto_filetype("frag", "glsl")
