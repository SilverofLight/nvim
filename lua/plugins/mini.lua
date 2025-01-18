return {
  {
    'echasnovski/mini.cursorword',
    version = '*',
    config = function()
      require('mini.cursorword').setup()
    end
  },
  {
    'echasnovski/mini.pairs',
    version = '*',
    config = function()
      require("mini.pairs").setup()
    end
  },
  {
    'echasnovski/mini.ai',
    version = '*',
    config = function ()
      require("mini.ai").setup()
    end
  },
}
