---@diagnostic disable: undefined-global
-- hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { silent = true })
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { silent = true })

-- cmp
local cmp = require("cmp")
local lspkind = require('lspkind')

local has_words_before = function()
  local col = vim.fn.col('.') - 1
  return col > 0 and vim.fn.getline('.'):sub(col, col):match('%s') == nil
end
cmp.setup({
  view = {
    entries = "custom"
  },
  formatting = {
    format = lspkind.cmp_format(),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = "snippets" },
    { name = "buffer" },
    { name = "path" },
    -- { name = "cmdline"},
    { name = "spell" },
    {
      name = "latex_symbols",
      entry_filter = function()
        return vim.bo.filetype == "markdown"
      end
    }
  }),
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
        cmp.select_next_item()
      elseif vim.snippet.active({ direction = 1 }) then
        vim.schedule(function()
          vim.snippet.jump(1)
        end)
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.snippet.active({ direction = -1 }) then
        vim.schedule(function()
          vim.snippet.jump(-1)
        end)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  experimental = {
    ghost_text = false,
  },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- setup lsp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig")['gopls'].setup {
  capabilities = capabilities
}
require("lspconfig")['lua_ls'].setup {
  capabilities = capabilities
}
require("lspconfig")['ruff'].setup {
  capabilities = capabilities
}
require("lspconfig")['vtsls'].setup {
  capabilities = capabilities
}

local clangd_capabilities = require("cmp_nvim_lsp").default_capabilities()
clangd_capabilities.offsetEncoding = { "utf-16" }
require("lspconfig")['clangd'].setup {
  capabilities = clangd_capabilities
}

vim.keymap.set('n', '<leader>fm', ":lua vim.lsp.buf.format { async = true }<CR>")
vim.keymap.set('n', 'gd', ":lua vim.lsp.buf.definition()<CR>")
vim.keymap.set('n', '<leader>ca', ":lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set('n', '<leader>r', ":lua vim.lsp.buf.rename()<CR>")
vim.keymap.set('n', 'gh', ":lua vim.lsp.buf.hover()<CR>")


-- render markdown
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = '#1D2128' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#242931' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = '#2B3139' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = '#323842' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { bg = '#323842' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { bg = '#323842' })
--
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH1', { fg = '#88C0D0' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH2', { fg = '#81A1C1' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH3', { fg = '#5E81AC' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH4', { fg = '#EBCB8B' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH5', { fg = '#A3BE8C' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH6', { fg = '#B48EAD' })
--
-- require('render-markdown').setup({
--   heading = {
--     enabled = true,
--     sign = true,
--     position = 'overlay',
--     icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
--     signs = { '󰫎 ' },
--     width = 'full',
--     left_margin = 0,
--     left_pad = 0,
--     right_pad = 0,
--     min_width = 0,
--     border = false,
--     border_virtual = false,
--     border_prefix = false,
--     above = '▄',
--     below = '▀',
--     backgrounds = {
--       'RenderMarkdownH1Bg',
--       'RenderMarkdownH2Bg',
--       'RenderMarkdownH3Bg',
--       'RenderMarkdownH4Bg',
--       'RenderMarkdownH5Bg',
--       'RenderMarkdownH6Bg',
--     },
--     foregrounds = {
--       'RenderMarkdownH1',
--       'RenderMarkdownH2',
--       'RenderMarkdownH3',
--       'RenderMarkdownH4',
--       'RenderMarkdownH5',
--       'RenderMarkdownH6',
--     },
--   },
-- })

-- copilot
vim.keymap.set('i', '<C-f>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

--- buffer line
vim.opt.termguicolors = true,
    require("bufferline").setup {}

-- neoscroll animation
require('neoscroll').setup({
  mappings = { -- Keys to be mapped to their corresponding default scrolling animation
    '<C-u>', '<C-d>',
    '<C-b>', '<C-f>',
    '<C-y>', '<C-e>',
  },
  hide_cursor = false,         -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  duration_multiplier = 1.0,   -- Global duration multiplier
  easing = 'linear',           -- Default easing function
  pre_hook = nil,              -- Function to run before the scrolling animation starts
  post_hook = nil,             -- Function to run after the scrolling animation ends
  performance_mode = false,    -- Disable "Performance Mode" on all buffers.
  ignored_events = {           -- Events ignored while scrolling
    'WinScrolled', 'CursorMoved'
  },
})

-- git signs
require('gitsigns').setup {
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end)
  end
}
