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
cmp.setup({
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
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
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- ["<leader><leader>"] = cmp.mapping.complete(),
        -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        -- ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
        end,
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
vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = '#1D2128' })
vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#242931' })
vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = '#2B3139' })
vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = '#323842' })
vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { bg = '#323842' })
vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { bg = '#323842' })

vim.api.nvim_set_hl(0, 'RenderMarkdownH1', { fg = '#88C0D0' })
vim.api.nvim_set_hl(0, 'RenderMarkdownH2', { fg = '#81A1C1' })
vim.api.nvim_set_hl(0, 'RenderMarkdownH3', { fg = '#5E81AC' })
vim.api.nvim_set_hl(0, 'RenderMarkdownH4', { fg = '#EBCB8B' })
vim.api.nvim_set_hl(0, 'RenderMarkdownH5', { fg = '#A3BE8C' })
vim.api.nvim_set_hl(0, 'RenderMarkdownH6', { fg = '#B48EAD' })

require('render-markdown').setup({
    heading = {
        enabled = true,
        sign = true,
        position = 'overlay',
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        signs = { '󰫎 ' },
        width = 'full',
        left_margin = 0,
        left_pad = 0,
        right_pad = 0,
        min_width = 0,
        border = false,
        border_virtual = false,
        border_prefix = false,
        above = '▄',
        below = '▀',
        backgrounds = {
            'RenderMarkdownH1Bg',
            'RenderMarkdownH2Bg',
            'RenderMarkdownH3Bg',
            'RenderMarkdownH4Bg',
            'RenderMarkdownH5Bg',
            'RenderMarkdownH6Bg',
        },
        foregrounds = {
            'RenderMarkdownH1',
            'RenderMarkdownH2',
            'RenderMarkdownH3',
            'RenderMarkdownH4',
            'RenderMarkdownH5',
            'RenderMarkdownH6',
        },
    },
})

-- copilot
vim.keymap.set('i', '<C-f>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
