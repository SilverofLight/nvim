require("config.keymaps")
require("config.lazy")
require("config.options")
require("config.cursor")
require("config.markdown_shortkey")
require("nvim-tree").setup()
require("lualine").setup {
  options = { theme = 'dracula-nvim' },
}
require("config.pluginConfig")
require("config.neovide")
require("config.autocmd")
