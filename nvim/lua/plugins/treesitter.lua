return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "cpp",
        "css",
        "csv",
        "html",
        "http",
        "javascript",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "make",
        "regex",
        "ssh_config",
        "vim",
      },
      highlights = { enable = true },
      matchup = { enable = true }
    }
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufRead", "BufNewFile" },
    main = { "rainbow-delimiters.setup" },
    opts = {},
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end
  },
}
