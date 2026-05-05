return {
  {
    "echasnovski/mini.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("mini.ai").setup({})
      require("mini.pairs").setup({})
      require("mini.statusline").setup({})
      local ts_context_commentstring = require("ts_context_commentstring")
      ts_context_commentstring.setup({
        enable_autocmd = false,
      })
      require('mini.comment').setup {
        options = {
          custom_commentstring = function()
            return ts_context_commentstring.calculate_commentstring() or vim.bo.commentstring
          end,
        },
      }
    end,
  },
}
