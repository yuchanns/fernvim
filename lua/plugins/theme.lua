local autocmd = require("utils.autocmd")

autocmd.user_pattern("LazyDone", function() vim.cmd([[colorscheme tokyonight]]) end)

return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      transparent = false,
      terminal_colors = true,
      styles = {
        functions = { italic = true },
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "terminal", "qf", "help" },
      on_highlights = function(h, _)
        -- h.String = { fg = "#eed49f" }
        h.String = { fg = "#c3e88d" }
        h["@keyword"] = { fg = "#ff757f" }
        h["@keyword.function"] = { fg = "#ff757f" }
        -- h["@property"] = { fg = "#c3e88d" }
        -- h["@variable.member"] = { fg = "#c3e88d" }
        h["@property"] = { fg = "#eed49f" }
        h["@variable.member"] = { fg = "#eed49f" }
      end,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
    },
    lazy = false,
    priority = 1000,
  },
  { "nvim-lua/lsp-status.nvim" },
  { "folke/lsp-colors.nvim", opt = {} },
}
