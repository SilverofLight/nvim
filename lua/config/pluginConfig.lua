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



vim.keymap.set('n', '<leader>fm', ":lua vim.lsp.buf.format { async = true }<CR>")
vim.keymap.set('n', 'gd', ":lua vim.lsp.buf.definition()<CR>")
vim.keymap.set('n', '<leader>ca', ":lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set('n', '<leader>r', ":lua vim.lsp.buf.rename()<CR>")
vim.keymap.set('n', 'gh', ":lua vim.lsp.buf.hover()<CR>")

-- lsp
local capabilities = require('blink.cmp').get_lsp_capabilities()
local lspconfig = require('lspconfig')

lspconfig['lua_ls'].setup({ capabilities = capabilities })
lspconfig['gopls'].setup({ capabilities = capabilities })
lspconfig['ruff'].setup({ capabilities = capabilities })
lspconfig['vtsls'].setup({ capabilities = capabilities })

local clangd_capabilities = require("blink.cmp").get_lsp_capabilities()
clangd_capabilities.offsetEncoding = { "utf-16" }
require("lspconfig")['clangd'].setup {
  capabilities = clangd_capabilities
}


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
