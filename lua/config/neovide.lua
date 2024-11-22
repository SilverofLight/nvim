if vim.g.neovide then
  vim.o.guicursor = "n-v-c:block-Cursor,i-ci:ver25-Cursor"
  vim.o.guifont = "Source Code Pro:h10"
  vim.cmd([[highlight Cursor guifg=#282A36 guibg=#cab6f7]])
end
