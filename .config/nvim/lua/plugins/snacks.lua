return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    indent = { enabled = true },
    scroll = { enabled = true },
    scope = { enabled = true },
    input = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit = {
      enabled = true,
      pkg = {
        lazygit = "lazygit",
      },
    },
    terminal = { enabled = true },
  },
  keys = {
    {
      "<leader>gg",
      function() Snacks.lazygit() end,
      desc = "LazyGit (root dir)",
    },
    {
      "<leader>gG",
      function() Snacks.lazygit({ cwd = vim.uv.cwd() }) end,
      desc = "LazyGit (cwd)",
    },
  },
}
