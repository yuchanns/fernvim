vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "vimdoc",
    "go",
    "typescript",
    "rust",
    "c",
    "vim",
    "lua",
    "query",
    "glsl",
  },
  ignore_install = { "phpdoc" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "org" },
    disable = function(lang, bufnr) return lang == "javascript" and vim.api.nvim_buf_line_count(bufnr) > 1000 end,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = ".",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
