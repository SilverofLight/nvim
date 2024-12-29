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
