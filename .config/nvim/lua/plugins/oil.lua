require("oil").setup({
  skip_confirm_for_simple_edits = false,
  view_options = {
    show_hidden = true,
  },
})
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
