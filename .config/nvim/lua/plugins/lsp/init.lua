vim.diagnostic.config({ virtual_text = true })
vim.lsp.inline_completion.enable()
require("plugins.lsp.mason")
require("plugins.lsp.lua")
require("plugins.lsp.typescript")
require("plugins.lsp.csharp")
vim.lsp.enable({
  "lua_ls",
  "roslyn",
  "vtsls",
  "vue_ls",
  "typos_lsp",
  "harper_ls",
  "bashls",
  "docker_language_server",
  "eslint",
  "html",
  "intelephense",
  "jsonls",
  "marksman",
  "unocss",
  "copilot",
  "cssls",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation", buffer = ev.buf })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = ev.buf })
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition", buffer = ev.buf })
    vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Show code actions", buffer = ev.buf })
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = ev.buf })
    vim.keymap.set({ "n", "v" }, "<leader>lR", "<cmd>lsp restart<cr>", { desc = "Restart LSP", buffer = ev.buf })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references", buffer = ev.buf })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = ev.buf })
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer", buffer = ev.buf })
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics", buffer = ev.buf })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous line diagnostic", buffer = ev.buf })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next line diagnostic", buffer = ev.buf })
    vim.keymap.set("i", "<C-g>", function()
      if not vim.lsp.inline_completion.get() then
        return "<C-g>"
      end
    end, { expr = true, desc = "Accept the current inline completion" })
  end,
})
