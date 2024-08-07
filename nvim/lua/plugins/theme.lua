return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false, priority = 1000,
  --   config = function()
  --     vim.cmd[[colorscheme tokyonight-night]]
  --   end
  -- },

  -- {
  --   "Shatur/neovim-ayu",
  --   lazy = false, priority = 1000,
  --   config = function()
  --     require("ayu").setup({})
  --     vim.cmd[[colorscheme ayu-dark]]
  --   end
  -- },

  -- {
  --   "navarasu/onedark.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("onedark").setup {
  --       style = "darker"
  --     }
  --     vim.cmd[[colorscheme onedark]]
  --   end
  -- },
  -- {
  --   'uloco/bluloco.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   dependencies = { 'rktjmp/lush.nvim' },
  --   config = function()
  --     require("bluloco").setup({
  --       style       = "auto",
  --       transparent = false,
  --       italics     = false,
  --       terminal    = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
  --       guicursor   = false,
  --     })
  --     vim.opt.termguicolors = true
  --     vim.cmd('colorscheme bluloco')
  --   end,
  -- },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        options = {
          transparent = true,
          styles = {
            comments = 'italic',
            keywords = 'bold',
            types    = 'italic, bold'
          }
        }
      })
      -- vim.cmd('colorscheme github_dark_default')
      vim.cmd('colorscheme github_dark_high_contrast')
    end,
  },
  -- {
  --   'sekke276/dark_flat.nvim',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('dark_flat').setup({
  --       transparent = false,
  --       italics = true,
  --     })
  --     vim.cmd('colorscheme dark_flat')
  --   end,
  -- },
  -- {
  --   'zootedb0t/citruszest.nvim',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('citruszest').setup({})
  --     vim.cmd('colorscheme citruszest')
  --   end,
  -- },
  -- {
  --   'dasupradyumna/midnight.nvim',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('midnight').setup({})
  --     vim.cmd('colorscheme midnight')
  --   end,
  -- },
  -- {
  --   'marko-cerovac/material.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('material').setup({
  --
  --       contrast = {
  --         terminal = false,          -- Enable contrast for the built-in terminal
  --         sidebars = false,          -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
  --         floating_windows = false,  -- Enable contrast for floating windows
  --         cursor_line = false,       -- Enable darker background for the cursor line
  --         lsp_virtual_text = false,  -- Enable contrasted background for lsp virtual text
  --         non_current_windows = false, -- Enable contrasted background for non-current windows
  --         filetypes = {},            -- Specify which filetypes get the contrasted (darker) background
  --       },
  --
  --       styles = { -- Give comments style such as bold, italic, underline etc.
  --         comments = { --[[ italic = true ]] },
  --         strings = { --[[ bold = true ]] },
  --         keywords = { --[[ underline = true ]] },
  --         functions = { --[[ bold = true, undercurl = true ]] },
  --         variables = {},
  --         operators = {},
  --         types = {},
  --       },
  --
  --       plugins = { -- Uncomment the plugins that you use to highlight them
  --         -- Available plugins:
  --         -- "coc",
  --         -- "colorful-winsep",
  --         -- "dap",
  --         -- "dashboard",
  --         -- "eyeliner",
  --         -- "fidget",
  --         -- "flash",
  --         -- "gitsigns",
  --         -- "harpoon",
  --         -- "hop",
  --         -- "illuminate",
  --         -- "indent-blankline",
  --         -- "lspsaga",
  --         -- "mini",
  --         -- "neogit",
  --         -- "neotest",
  --         -- "neo-tree",
  --         -- "neorg",
  --         -- "noice",
  --         -- "nvim-cmp",
  --         -- "nvim-navic",
  --         -- "nvim-tree",
  --         -- "nvim-web-devicons",
  --         -- "rainbow-delimiters",
  --         -- "sneak",
  --         -- "telescope",
  --         -- "trouble",
  --         -- "which-key",
  --         -- "nvim-notify",
  --       },
  --
  --       disable = {
  --         colored_cursor = false, -- Disable the colored cursor
  --         borders = false,      -- Disable borders between verticaly split windows
  --         background = false,   -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
  --         term_colors = false,  -- Prevent the theme from setting terminal colors
  --         eob_lines = false     -- Hide the end-of-buffer lines
  --       },
  --
  --       high_visibility = {
  --         lighter = false, -- Enable higher contrast text for lighter style
  --         darker = false -- Enable higher contrast text for darker style
  --       },
  --
  --       lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
  --       async_loading = true,  -- Load parts of the theme asyncronously for faster startup (turned on by default)
  --       custom_colors = nil,   -- If you want to override the default colors, set this to a function
  --       custom_highlights = {}, -- Overwrite highlights with your own
  --     })
  --     vim.g.material_style = "deep ocean"
  --     vim.cmd('colorscheme material')
  --   end,
  -- },
}
