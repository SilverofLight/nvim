return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,   -- set this if you want to always pull the latest change
  opts = {
    -- add any opts here
    provider = "copilot",
    -- vendors = {
    --   ollama = {
    --     __inherited_from = "openai",
    --     api_key_name = "",
    --     endpoint = "http://127.0.0.1:11434/v1",
    --     model = "stable-code",
    --   },
    -- },

    mappings = {
      ask = "<leader>ua",
      edit = "<leader>k",           -- edit
      refresh = "<leader>ur",       -- refresh
    },
    behaviour = {
      auto_suggestions = false,       -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = false,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
      minimize_diff = true,       -- Whether to remove unchanged lines when applying a code block
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp",                -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons",     -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",          -- for providers='copilot'
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
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
