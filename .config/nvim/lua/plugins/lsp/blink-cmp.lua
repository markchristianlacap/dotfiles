return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "markchristianlacap/csharp-namespace.nvim",
  },

  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = { documentation = { auto_show = false } },

    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
        "csharp_namespace",
      },
      providers = {
        csharp_namespace = {
          module = "blink-csharp-namespace",
          name = "C# Namespace",
          opts = {},
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
