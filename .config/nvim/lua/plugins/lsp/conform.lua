require("conform").setup({
  default_format_opts = {
    lsp_format = "last",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    cs = { "csharpier", lsp_format = "first" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    vue = { "prettierd" },
  },
  format_on_save = {},
})
