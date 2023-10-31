return {
  {
    "uga-rosa/translate.nvim",
    event = "VimEnter",
    opts = {
      default = {command = "google"},
      preset = {
        output = {
          split = {append = true}
        }
      }
    },
    config = function()
      vim.keymap.set("n", "<leader>t", ":Translate JA<CR>")
    end
  }
}
