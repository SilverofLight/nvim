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
    -- optional: provides snippets for the snippet source
    -- dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = {
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },

        ['<Tab>'] = {
          'select_next',
          'fallback'
        },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = false,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true
          }
        },
        list = {
          selection = "auto_insert"
        },
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
    opts_extend = { "sources.default" }
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
  {
    "onsails/lspkind.nvim"
  }
}
