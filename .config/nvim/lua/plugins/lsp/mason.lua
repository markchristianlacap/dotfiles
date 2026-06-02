require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:crashdummyy/mason-registry",
  },
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "lua-language-server",
    "roslyn",
    "vue-language-server",
    "vtsls",
    "bash-language-server",
    "docker-language-server",
    "eslint-lsp",
    "html-lsp",
    "intelephense",
    "json-lsp",
    "marksman",
    "unocss-language-server",
    "copilot-language-server",
    "css-lsp",
    "stylua",
    "csharpier",
    "cspell-lsp",
    "sqls",
    "netcoredbg",
  },
})
