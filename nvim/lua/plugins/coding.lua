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
      {"neovim/nvim-lspconfig"},
      {"hrsh7th/cmp-nvim-lsp"}
    },
    config = function()
      local opt = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      }
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup(opt)
        end
      }
    end
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/vim-vsnip",
      "hrsh7th/vim-vsnip-integ",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup({

        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end
        },

        window = {
          completion = cmp.config.window.bordered({
            -- border = 'single'
          }),
          documentation = cmp.config.window.bordered({
            -- border = 'single'
          }),
        },

        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({select = true}),
        }),

        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
          })
        },

        sources = cmp.config.sources({
          {name = "nvim_lsp"},
          {name = "vsnip"},
          {name = "buffer"},
          {name = "calc"},
          {name = "path"},
          {name = "nvim_lsp_signature_help"},
        }),
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          {name = 'nvim_lsp_document_symbol'},
          {name = 'buffer'}
        })
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          {name = 'path'},
          {name = 'cmdline'}
        })
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      vim.cmd('let g:vsnip_filetypes = {}')
    end
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    event = "VimEnter",
    opts = {},
  }
}
