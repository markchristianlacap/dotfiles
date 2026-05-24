local Snacks = require("snacks")
Snacks.setup({
  indent = {},
  image = {},
  input = {},
  lazygit = {},
  rename = {},
})
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end,
})
vim.keymap.set("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })
