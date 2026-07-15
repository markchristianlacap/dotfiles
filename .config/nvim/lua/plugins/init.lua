vim.pack.add({
  "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/markchristianlacap/csharp-namespace.nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mrjones2014/smart-splits.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/romus204/tree-sitter-manager.nvim",
  "https://github.com/seblyng/roslyn.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/onsails/lspkind.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/folke/flash.nvim",
  {
    src = "https://github.com/vieitesss/miniharp.nvim",
    version = vim.version.range("v*"),
  },
  {
    src = "https://github.com/saghen/blink.cmp",
    version = "v1",
  },
})
require("plugins.mini")
require("plugins.snacks")
require("plugins.treesitter")
require("plugins.smart-splits")
require("plugins.fugitive")
require("plugins.blink")
require("plugins.lsp")
require("plugins.oil")
require("plugins.miniharp")
require("plugins.flash")
