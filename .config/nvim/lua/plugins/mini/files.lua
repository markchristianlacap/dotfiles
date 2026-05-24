require("mini.files").setup({
  mappings = {
    synchronize = "w",
    go_in_plus = "<CR>",
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
