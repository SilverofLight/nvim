return {
  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },

    opts = function()
      local cmp = require("cmp")
      return {
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
          -- ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer" },
          { name = "snippets"},
        }),
      }
    end,
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
    keys = {
      {
         "<Tab>",
         function()
           if vim.snippet.active({ direction = 1 }) then
             vim.schedule(function()
               vim.snippet.jump(1)
             end)
             return
           end
           return "<Tab>"
         end,
         expr = true,
         silent = true,
         mode = "i",
      },
      {
         "<Tab>",
         function()
           vim.schedule(function()
             vim.snippet.jump(1)
           end)
         end,
         expr = true,
         silent = true,
         mode = "s",
      },
      {
         "<S-Tab>",
         function()
           if vim.snippet.active({ direction = -1 }) then
             vim.schedule(function()
               vim.snippet.jump(-1)
             end)
             return
           end
           return "<S-Tab>"
         end,
         expr = true,
         silent = true,
         mode = { "i", "s" },
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
      table.insert(opts.sources, {
        name = "latex_symbols",
        option = {
          strategy = 0,
        },
        -- if the file is not markdown, then this plugin will not work
        entry_filter = function()
          return vim.bo.filetype == "markdown"
        end,
      })
    end,
  },
}
