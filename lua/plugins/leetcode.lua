return {
  "yuchanns/leetcode.nvim",
  build = ":TSUpdate html",
  branch = "top-150",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lang = "rust",
    arg = "leet",
  },
}
