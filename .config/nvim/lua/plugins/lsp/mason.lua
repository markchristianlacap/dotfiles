return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local mason_tool_installer = require "mason-tool-installer"

    -- Core setup
    mason.setup {
      registries = {
        "github:mason-org/mason-registry",
        "github:crashdummyy/mason-registry",
      },
    }

    -- Auto-install language servers
    mason_lspconfig.setup {
      ensure_installed = {
        "eslint",
        "emmet_language_server",
        "vue_ls",
        "lua_ls",
        "cssls",
        "html",
        "jsonls",
        "yamlls",
        "dockerls",
        "intelephense",
        "vtsls",
      },
      automatic_installation = true,
    }

    -- Auto-install formatters and linters
    mason_tool_installer.setup {
      ensure_installed = {
        "csharpier",
        "cspell",
        "roslyn",
      },
    }
  end,
}
