return {
  "SilverofLight/kd_translate.nvim",
  config = function()
    require("kd").setup({
      window = {
        width = 50
      }
    })
  end,
  vim.keymap.set("n", "<leader>t", ":TranslateNormal<CR>"),
  vim.keymap.set("v", "<leader>t", ":TranslateVisual<CR>")
}
