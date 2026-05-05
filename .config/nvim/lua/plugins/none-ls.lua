return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "davidmh/cspell.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local cspell = require("cspell")
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        cspell.diagnostics.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity.HINT
          end,
        }),
        cspell.code_actions,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.csharpier,
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.formatting.eslint_d"),
      },
    })
  end,
}
