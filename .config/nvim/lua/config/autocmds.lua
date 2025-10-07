-- =======================================
-- 🧹 AUTO FORMATTING
-- =======================================
local format = require("utils.format")

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("AutoFormatOnSave", { clear = true }),
  callback = function() format.on_save() end,
})

-- ✨ Yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  callback = function() vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 } end,
})
