return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require "mason"
    local mason_tool_installer = require "mason-tool-installer"
    mason.setup {
      registries = {
        "github:mason-org/mason-registry",
        "github:crashdummyy/mason-registry",
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        -- LSP servers
        "eslint-lsp",
        "emmet-language-server",
        "vue-language-server",
        "lua-language-server",
        "css-lsp",
        "docker-language-server",
        "html-lsp",
        "yaml-language-server",
        "intelephense",
        "vtsls",
        "unocss-language-server",

        -- tools
        "csharpier",
        "cspell",
        "roslyn",
      },
    }
  end,
}
