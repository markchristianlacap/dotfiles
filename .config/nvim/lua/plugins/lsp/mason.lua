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
        "html-lsp",
        "json-lsp",
        "yaml-language-server",
        "dockerfile-language-server",
        "intelephense",
        "vtsls",

        -- tools
        "csharpier",
        "cspell",
        "roslyn",
      },
    }
  end,
}
