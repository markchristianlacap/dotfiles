require("conform").setup({
  default_format_opts = {
    lsp_format = "last",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    cs = { "csharpier", lsp_format = "first" },
    ["*"] = {},
    sql = { "sql-formatter", lsp_format = "never" },
  },
  timeout_ms = 5000,
  format_on_save = {},
})
