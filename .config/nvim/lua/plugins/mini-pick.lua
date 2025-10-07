return {
  "echasnovski/mini.pick",
  dependencies = {
    "echasnovski/mini.extra",
  },
  version = false,
  config = function()
    require("mini.pick").setup {
      mappings = {
        move_down = "<C-j>",
        move_up = "<C-k>",
      },
    }
    require("mini.extra").setup()
    vim.ui.select = MiniPick.ui_select
  end,
  keys = {
    { "<leader>ff", "<CMD>Pick files<CR>",      desc = "Pick files" },
    { "<leader>fo", "<CMD>Pick oldfiles<CR>",   desc = "Pick resume files" },
    { "<leader>fb", "<CMD>Pick buffers<CR>",    desc = "Pick buffers" },
    { "<leader>fw", "<CMD>Pick grep_live<CR>",  desc = "Pick words" },
    { "<leader>fh", "<CMD>Pick history<CR>",    desc = "Pick history" },
    { "<leader>fd", "<CMD>Pick diagnostic<CR>", desc = "Pick diagnostics" },
    { "<leader>fe", "<CMD>Pick explorer<CR>",   desc = "Pick explorer" },
    { "<leader>fk", "<CMD>Pick keymaps<CR>",    desc = "Pick keymaps" },
    { "<leader>fm", "<CMD>Pick marks<CR>",      desc = "Pick marks" },
    { "<leader>fg", "<CMD>Pick git_files<CR>",  desc = "Pick git files" },
  },
}
