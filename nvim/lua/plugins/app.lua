return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {separator_style = "thick"},
      highlights = {
        buffer_selected = {italic = false}
      }
    },
  },

  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {}
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VimEnter",
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }
      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", {fg = "#E06C75"})
        vim.api.nvim_set_hl(0, "RainbowYellow", {fg = "#E5C07B"})
        vim.api.nvim_set_hl(0, "RainbowBlue", {fg = "#61AFEF"})
        vim.api.nvim_set_hl(0, "RainbowOrange", {fg = "#D19A66"})
        vim.api.nvim_set_hl(0, "RainbowGreen", {fg = "#98C379"})
        vim.api.nvim_set_hl(0, "RainbowViolet", {fg = "#C678DD"})
        vim.api.nvim_set_hl(0, "RainbowCyan", {fg = "#56B6C2"})
      end)

      vim.g.rainbow_delimiters = {highlight = highlight}
      require("ibl").setup {scope = {highlight = highlight}}

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
  },


  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = {
          highlight_whole_line = false,
        }
      })
      vim.keymap.set(
        "",
        "<Leader>l",
        require("lsp_lines").toggle,
        {desc = "Toggle lsp_lines"}
      )
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    opts = {}
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {}
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = {"BufRead", "BufNewFile"},
    config = function()
      vim.o.termguicolors = true
      require("colorizer").setup()
    end
  },

  {
    "rcarriga/nvim-notify",
    main = "notify",
    opts = {}
  },
}
