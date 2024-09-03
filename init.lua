require("config.keymaps")
require("config.lazy")
require("config.options")
require("nvim-tree").setup()
require("lualine").setup {
  options = { theme = 'tokyonight-moon' },
}
require("config.pluginConfig")


