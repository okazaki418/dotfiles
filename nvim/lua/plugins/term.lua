return {
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    config = function()
      require("toggleterm").setup{}
      vim.keymap.set({'n', 'v'}, 'tt', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
    end
  }
}
