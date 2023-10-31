return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = {
      {"williamboman/mason.nvim"},
      {"neovim/nvim-lspconfig"}
    },
    config = function()
      local opt = {}
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup(opt)
        end
      }
    end
  }
}
