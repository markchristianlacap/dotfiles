local function eslint_or_lsp(bufnr)
  local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "eslint" })
  if #clients > 0 then
    vim.cmd("LspEslintFixAll")
    return { lsp_format = "never" }
  else
    return { lsp_format = "first" }
  end
end
require("conform").setup({
  default_format_opts = {
    lsp_format = "last",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    cs = { "csharpier", lsp_format = "first" },
    vue = eslint_or_lsp,
    typescript = eslint_or_lsp,
    javascript = eslint_or_lsp,
    json = eslint_or_lsp,
    ["*"] = {},
  },
  timeout_ms = 5000,
  format_on_save = {},
})
