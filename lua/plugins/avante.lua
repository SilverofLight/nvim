return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "copilot",
      auto_suggestions_provider = "openai", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
      openai = {
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
        api_key_name = "DEEPSEEK_API_KEY"
      },
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_keymaps = false,
        auto_set_highlight_group = true,
      },
      hints = { enabled = false },
      mappings = {
        --- @class AvanteConflictMappings
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<C-l>",
          next = "<C-]>",
          prev = "<C-[>",
          dismiss = "<C-e>"
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      {
        "zbirenbaum/copilot.lua",    -- for providers='copilot'
        opts = {
          panel = {
            enabled = true,
            auto_refresh = false,
            keymap = {
              jump_prev = "[[",
              jump_next = "]]",
              accept = "<CR>",
              refresh = "gr",
              open = "<M-CR>"
            },
            layout = {
              position = "bottom", -- | top | left | right | horizontal | vertical
              ratio = 0.4
            },
          },
          suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = true,
            debounce = 75,
            keymap = {
              accept = "<C-l>",
              accept_word = "<C-e>",
              accept_line = "<C-i>",
              next = "<C-]>",
              prev = "<C-[>",
              dismiss = "<C-\\>",
            },
          },
          filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
          },
          copilot_node_command = 'node', -- Node.js version must be > 18.x
          server_opts_overrides = {},
        }
      },
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
          file_types = { "Avante" },
        },
        ft = { "Avante" },
      },
    },
  },
}
