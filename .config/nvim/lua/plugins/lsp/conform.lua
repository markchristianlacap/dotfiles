require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    cs = { "csharpier", lsp_format = "first" },
    ["*"] = function()
      local client = vim.lsp.get_clients({ bufnr = 0 })
      for _, c in pairs(client) do
        if c.name == "eslint" then
          vim.cmd("LspEslintFixAll")
          return { lsp_format = "never" }
        end
      end
      return { lsp_format = "fallback" }
    end,
  },
  timeout_ms = 5000,
  format_on_save = {},
})
