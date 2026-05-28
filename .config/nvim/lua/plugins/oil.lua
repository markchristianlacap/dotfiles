require("oil").setup({
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-v>"] = { "actions.select", opts = { vertical = true } },
    ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
    ["<C-t>"] = { "actions.select", opts = { tab = true } },
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = { "actions.close", mode = "n" },
    ["<C-r>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },
  -- Set to false to disable all of the above keymaps
  use_default_keymaps = false,
  skip_confirm_for_simple_edits = false,
  view_options = {
    show_hidden = true,
  },
})
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
