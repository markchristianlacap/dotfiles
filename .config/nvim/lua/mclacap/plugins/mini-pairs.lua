return {
  "echasnovski/mini.pairs",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>up",
      function()
        vim.g.minipairs_disable = not vim.g.minipairs_disable
        if vim.g.minipairs_disable then
          print("disabled auto pairs")
        else
          print("enabled auto pairs")
        end
      end,
      desc = "Toggle auto pairs",
    },
  },
}
