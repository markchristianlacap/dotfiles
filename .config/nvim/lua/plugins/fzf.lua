return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {
    keymap = {
      builtin = {
        ["<ctrl-j>"] = "preview-page-down",
        ["<ctrl-k>"] = "preview-page-up",
      },
    },
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)
    require("fzf-lua").register_ui_select()
  end,
  ---@diagnostic enable: missing-fields
}
