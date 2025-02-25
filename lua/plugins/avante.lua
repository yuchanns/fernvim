local system = require("utils.system")

local build = "make BUILD_FROM_SOURCE=false"
if system.is_windows() then
  build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
end

return {
  "yetone/avante.nvim",
  build = build,
  event = "VeryLazy",
  opts = {
    provider = "copilot",
    auto_suggestions_provider = "azure",
    copilot = {
      model = "claude-3.7-sonnet",
    },
    web_search_engine = {
      provider = "kagi"
    },
    azure = {
      endpoint = "https://malacca.yuchanns.xyz/azure-openai/yuchanns-eastus",
      deployment = "gpt-4o-mini",
      model = "gpt-4o-mini",
      api_version = "2025-01-01-preview",
      temperature = 0,
      max_tokens = 8192,
    },
    behaviour = {
      support_paste_from_clipboard = true,
      auto_suggestions = false,
    },
    mappings = {
      ask = "ca",
      edit = "ce",
      refresh = "cr",
      diff = {
        ours = "co",
        theirs = "ct",
        none = "c0",
        both = "cb",
        next = "]x",
        prev = "[x",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
    },
  },
  dependencies = {
    "github/copilot.vim",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  }
}
