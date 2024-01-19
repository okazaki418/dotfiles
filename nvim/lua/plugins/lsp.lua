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
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
      {"williamboman/mason.nvim"},
      {"neovim/nvim-lspconfig"},
      {"hrsh7th/cmp-nvim-lsp"}
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
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim"
    },
    opts = {
      handlers = {}
    },
  },
}
