return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false, priority = 1000,
  --   config = function()
  --     vim.cmd[[colorscheme tokyonight-night]]
  --   end
  -- },

  {
    "Shatur/neovim-ayu",
    lazy = false, priority = 1000,
    config = function()
      require("ayu").setup({})
      vim.cmd[[colorscheme ayu-dark]]
    end
  },
}
