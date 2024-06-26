return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = { separator_style = "thick" },
      highlights = {
        buffer_selected = { italic = false }
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
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup { scope = { highlight = highlight } }

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
        "<leader>l",
        require("lsp_lines").toggle,
        { desc = "Toggle lsp_lines" }
      )
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      local lualine = require("lualine")

      local colors = {
        red    = "#E06C75",
        yellow = "#E5C07B",
        blue   = "#61AFEF",
        orange = "#D19A66",
        green  = "#98C379",
        violet = "#C678DD",
        cyan   = "#56B6C2",
      }

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
      }

      local config = {
        options = {
          component_separators = "",
          section_separators = "",
          -- theme = "onedark",
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        inactive_section = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        }
      }

      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      ins_left {
        function()
          return "▊"
        end,
        color = function()
          local mode_color = {
            n = colors.blue,
            i = colors.green,
            v = colors.violet,
            V = colors.violet,
            c = colors.orange,
            s = colors.violet,
            S = colors.violet,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { left = 0, right = 0 },
      }

      ins_left {
        "mode",
        color = function()
          local mode_color = {
            n = colors.blue,
            i = colors.green,
            v = colors.violet,
            V = colors.violet,
            c = colors.orange,
            s = colors.violet,
            S = colors.violet,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end
      }

      ins_left {
        "filename",
        cond = conditions.buffer_not_enpty,
      }

      ins_left {
        "branch",
        color = { fg = colors.violet }
      }
      ins_left {
        "diff",
        symbols = {
          added    = " ",
          modified = " ",
          removed  = " "
        },
        diff_color = {
          added    = { fg = colors.green },
          modified = { fg = colors.orange },
          removed  = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      }

      ins_left {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        diagnostics_color = {
          error = { fg = colors.red },
          warn  = { fg = colors.yellow },
          info  = { fg = colors.cyan },
          hint  = { fg = colors.green },
        }
      }

      ins_right {
        'o:encoding',
        fmt = string.upper,
        cond = conditions.hide_in_width,
      }

      ins_right {
        "fileformat",
        fmt = string.upper,
        icons_enabled = true,
      }
      ins_right {
        "fileformat",
        fmt = string.upper,
        icons_enabled = false,
        padding = { left = 0, right = 1 },
      }

      ins_right {
        "filetype"
      }

      ins_right {
        "progress",
        color = function()
          local mode_color = {
            n = colors.blue,
            i = colors.green,
            v = colors.violet,
            V = colors.violet,
            c = colors.orange,
            s = colors.violet,
            S = colors.violet,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end,
      }

      ins_right {
        "location",
        color = function()
          local mode_color = {
            n = colors.blue,
            i = colors.green,
            v = colors.violet,
            V = colors.violet,
            c = colors.orange,
            s = colors.violet,
            S = colors.violet,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end,
      }

      ins_right {
        function()
          return "▊"
        end,
        color = function()
          local mode_color = {
            n = colors.blue,
            i = colors.green,
            v = colors.violet,
            V = colors.violet,
            c = colors.orange,
            s = colors.violet,
            S = colors.violet,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { left = 0, right = 0 },
      }

      lualine.setup(config)
    end
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
    },
    opts = {}
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.o.termguicolors = true
      require("colorizer").setup()
    end
  },

  -- {
  --   "rcarriga/nvim-notify",
  --   main = "notify",
  --   opts = {}
  -- },
}
