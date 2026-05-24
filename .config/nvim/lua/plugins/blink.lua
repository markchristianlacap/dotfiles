local cmp = require("blink.cmp")
cmp.build():wait(60000)
cmp.setup({
  keymap = {
     preset = 'enter',
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer", "csharp_namespace" },
    providers = {
      csharp_namespace = {
        module = "csharp-namespace.completion.blink",
        name = "C# Namespace",
      },
    },
  },
})
