return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    dependencies = {
      "andymass/vim-matchup",
    },
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
        "ssh_config",
        "vim",
      },
      highlights = {enable = true},
      matchup = {enable = true}
    }
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufRead",
    opts = {},
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
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
