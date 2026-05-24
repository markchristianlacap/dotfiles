local cmp = require('blink.cmp')
cmp.build():wait(60000)
cmp.setup({
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
})
