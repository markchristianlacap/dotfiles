local cmp = require("blink.cmp")
cmp.setup({
  keymap = {
    preset = "enter",
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
  completion = {
    menu = {
      draw = {
        components = {
          kind_icon = {
            text = function(ctx)
              if ctx.source_name ~= "Path" then
                return (require("lspkind").symbol_map[ctx.kind] or "") .. ctx.icon_gap
              end

              local is_unknown_type =
                  vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" }, ctx.item.data.type)
              local mini_icon, _ = require("mini.icons").get(
                is_unknown_type and "os" or ctx.item.data.type,
                is_unknown_type and "" or ctx.label
              )

              return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
            end,

            highlight = function(ctx)
              if ctx.source_name ~= "Path" then
                return ctx.kind_hl
              end

              local is_unknown_type =
                  vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" }, ctx.item.data.type)
              local mini_icon, mini_hl = require("mini.icons").get(
                is_unknown_type and "os" or ctx.item.data.type,
                is_unknown_type and "" or ctx.label
              )
              return mini_icon ~= nil and mini_hl or ctx.kind_hl
            end,
          },
        },
      },
    },
  },
})
