-- Diagnostic symbols and settings
vim.g.have_nerd_font = true

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.HINT]  = " ",
    },
  },
  virtual_text = { current_line = true },
  severity_sort = true,
  update_in_insert = false,
})
