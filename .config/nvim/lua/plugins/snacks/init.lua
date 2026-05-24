local Snacks = require("snacks")
Snacks.setup({
  indent = {},
  image = {},
  input = {},
  lazygit = {},
})
vim.keymap.set("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })
