return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    skip_confirm_for_simple_edits = true,
    view_options = { show_hidden = true },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
