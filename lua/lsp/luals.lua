local fn, uv = vim.fn, vim.uv
local system = require("utils.system")

if not system.is_executable("lua-language-server") then return end
local lspconfig = require("lspconfig")
-- luars.json https://luals.github.io/wiki/configuration/#luarcjson-file
lspconfig["lua_ls"].setup({
  settings = { Lua = {} },
  -- capabilities = capabilities,
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if uv.fs_stat(path .. "/.luarc.json") or uv.fs_stat(path .. "/.luarc.jsonc") then return end
    end
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
        special = { reload = "require" },
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "hs", "vim", "it", "describe", "before_each", "after_each" },
        disable = { "lowercase-global" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          fn.expand("$VIMRUNTIME/lua"),
          fn.expand("$VIMRUNTIME/lua/vim/lsp"),
          fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      hint = {
        enable = true,
        setType = true,
      },
    })

    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end,
})

if system.is_executable("stylua") then
  local stylua = require("stylua-nvim")
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.lua",
    group = vim.api.nvim_create_augroup("LuaFormat", { clear = true }),
    callback = function() stylua.format_file() end,
  })
end
