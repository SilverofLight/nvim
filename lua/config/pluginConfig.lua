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

if not vim.g.vscode then
  -- blink.cmp ghost color
  vim.api.nvim_set_hl(0, 'BlinkCmpGhostText', { fg = '#5E81AC' })

  -- lsp
  local capabilities = require('blink.cmp').get_lsp_capabilities()
  local lspconfig = require('lspconfig')

  lspconfig['lua_ls'].setup({ capabilities = capabilities })
  lspconfig['gopls'].setup({ capabilities = capabilities })
  lspconfig['ruff'].setup({ capabilities = capabilities })
  lspconfig['vtsls'].setup({ capabilities = capabilities })
  lspconfig['bashls'].setup({ capabilities = capabilities })

  local clangd_capabilities = require("blink.cmp").get_lsp_capabilities()
  clangd_capabilities.offsetEncoding = { "utf-16" }
  require("lspconfig")['clangd'].setup {
    capabilities = clangd_capabilities
  }
end


-- copilot
-- vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false
-- })
-- vim.g.copilot_no_tab_map = true

--- buffer line
vim.opt.termguicolors = true,
    require("bufferline").setup {}


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

-- avante
vim.keymap.set("n", "ta", "<cmd>AvanteToggle<CR>")
vim.keymap.set("v", "<leader>ta", "<cmd>AvanteAsk<CR>")
vim.keymap.set("v", "<leader>te", "<cmd>AvanteEdit<CR>")
