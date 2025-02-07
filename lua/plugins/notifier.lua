return {
  {
    "vigoux/notifier.nvim",
    config = function()
      require 'notifier'.setup {
        -- You configuration here
      }
    end
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end
  }
}
