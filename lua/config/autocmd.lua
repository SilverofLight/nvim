local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = false })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- 为 BufRead 事件创建自动命令
vim.api.nvim_create_autocmd("BufRead", {
  group = augroup("HighlightPlusPlus"),
  callback = function()
    -- 设置语法匹配
    vim.fn.matchadd("PlusPlus", "<++>")
    -- 设置高亮样式
    vim.cmd("highlight PlusPlus guifg=black guibg=#CBA6F7 ctermfg=Red ctermbg=NONE")
  end,
})

-- 为 BufNewFile 事件创建自动命令
vim.api.nvim_create_autocmd("BufNewFile", {
  group = augroup("HighlightPlusPlus"),
  callback = function()
    -- 设置语法匹配
    vim.fn.matchadd("PlusPlus", "<++>")
    -- 设置高亮样式
    vim.cmd("highlight PlusPlus guifg=black guibg=#CBA6F7 ctermfg=Red ctermbg=NONE")
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})
