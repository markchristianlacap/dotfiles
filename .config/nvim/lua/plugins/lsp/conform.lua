require("conform").setup({
  default_format_opts = {
    lsp_format = "last",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    cs = { "csharpier", lsp_format = "first" },
    vue = function()
      vim.cmd("LspEslintFixAll")
      return { lsp_format = "never" }
    end,
    ["*"] = {},
  },
  timeout_ms = 5000,
  format_on_save = {},
})
