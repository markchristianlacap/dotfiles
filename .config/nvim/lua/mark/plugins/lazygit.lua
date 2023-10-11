return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit", silent = true } },
  }
}
