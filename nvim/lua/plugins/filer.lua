return {
  {
    "stevearc/oil.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    event = "VimEnter",
    main = "oil",
    config = function()
      require("oil").setup({
        default_file_explorer = true
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", {desc = "Open parent directory"})
    end
  },
}
