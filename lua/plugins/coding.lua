return {
  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    version = false,     -- last release is way too old
    -- event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "f3fora/cmp-spell",
    },
    event = "InsertEnter",
  },

  -- auto pairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
  },

  -- snippets
  {
    "nvim-cmp",
    dependencies = {
      {
        "garymjr/nvim-snippets",
        opts = {
          friendly_snippets = false,
        },
      },
    },
  },

  -- latex
  {
    "nvim-cmp",
    dependencies = {
      "SilverofLight/cmp-latex-symbols",
    },
    opts = function(_, opts)
      -- table.insert(opts.sources, {
      --   name = "latex_symbols",
      --   option = {
      --     strategy = 0,
      --   },
      --   -- if the file is not markdown, then this plugin will not work
      --   entry_filter = function()
      --     return vim.bo.filetype == "markdown"
      --   end,
      -- })
    end,
  },

  -- lspkind
  {
    "onsails/lspkind.nvim"
  }
}
