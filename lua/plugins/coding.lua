return {
  -- auto completion
  -- {
  --   "hrsh7th/nvim-cmp",
  --   version = false,     -- last release is way too old
  --   -- event = "InsertEnter",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-cmdline",
  --     "f3fora/cmp-spell",
  --   },
  --   event = "InsertEnter",
  -- },
  {
    'saghen/blink.cmp',
    cond = not vim.g.vscode,
    -- optional: provides snippets for the snippet source
    -- dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'super-tab'
        -- ['<Tab>'] = {
        --   'accept',
        --   'fallback'
        -- },
      },

      appearance = {
        use_nvim_cmp_as_default = false,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        nerd_font_variant = 'mono'
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true
          }
        },
        -- list = {
        --   selection = "auto_insert"
        -- },
        menu = {
          draw = {
            treesitter = { "lsp" }
          },
          border = "rounded",
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = "rounded",
          }
        },
        ghost_text = {
          enabled = true
        },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
          cmdline = { 'path', 'cmdline' }
        },
    },
  },

  -- auto pairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
  },

  -- snippets
  -- {
  --   "nvim-cmp",
  --   dependencies = {
  --     {
  --       "garymjr/nvim-snippets",
  --       opts = {
  --         friendly_snippets = false,
  --       },
  --     },
  --   },
  -- },

  -- latex
  -- {
  --   "nvim-cmp",
  --   dependencies = {
  --     "SilverofLight/cmp-latex-symbols",
  --   },
  --   opts = function(_, opts)
  --     -- table.insert(opts.sources, {
  --     --   name = "latex_symbols",
  --     --   option = {
  --     --     strategy = 0,
  --     --   },
  --     --   -- if the file is not markdown, then this plugin will not work
  --     --   entry_filter = function()
  --     --     return vim.bo.filetype == "markdown"
  --     --   end,
  --     -- })
  --   end,
  -- },

  -- lspkind
  -- {
  --   "onsails/lspkind.nvim"
  -- }
}
