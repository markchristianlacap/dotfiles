require("mini.snippets").setup({
  snippets = {
    require("mini.snippets").gen_loader.from_lang(),
  },
})
require("mini.snippets").start_lsp_server({ match = false })
