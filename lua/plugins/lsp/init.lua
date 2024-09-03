return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    config = function()
      local lspconfig = require("lspconfig")
    end
  },


  -- mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>" } },
    config = function()
      require("mason").setup()
    end
  },
  { "williamboman/mason-lspconfig.nvim" }
}

