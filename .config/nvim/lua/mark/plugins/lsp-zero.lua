return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  event = { "InsertEnter" },
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
  },
  config = function()
    local lsp_zero = require('lsp-zero')
    local lspconfig = require('lspconfig')

    lsp_zero.on_attach(function(_, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = { 'omnisharp', 'eslint', 'volar', 'unocss', 'lua_ls' },
      handlers = {
        lsp_zero.default_setup,
      }
    })

    lspconfig.volar.setup({
      on_init = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
      end
    })

    lspconfig.eslint.setup({
      settings = {
        packageManager = 'pnpm'
      },
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })
  end,
}
