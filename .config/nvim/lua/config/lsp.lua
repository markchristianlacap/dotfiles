-- ======================
-- 🔧 LSP CONFIGURATION
-- ======================
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(event)
    local bufopts = { buffer = event.buf, silent = true }
    local keymap = vim.keymap.set
    local function lmap(mode, lhs, rhs, desc)
      keymap(mode, lhs, rhs, vim.tbl_extend("force", bufopts, { desc = desc }))
    end

    lmap("n", "gR", vim.lsp.buf.references, "Show LSP references")
    lmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    lmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
    lmap({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code actions")
    lmap("n", "<leader>lr", vim.lsp.buf.rename, "Smart rename")
    lmap("n", "<leader>ld", vim.diagnostic.open_float, "Show diagnostics")
    lmap("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
    lmap("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
    lmap("n", "K", vim.lsp.buf.hover, "Hover docs")
    lmap("n", "<leader>lR", "<cmd>LspRestart<CR>", "Restart LSP")
  end,
})
