-- LSP keymaps setup when attached
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gR", vim.lsp.buf.references, "Show references")
    map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code actions")
    map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>ld", vim.diagnostic.open_float, "Show diagnostics")
    map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
    map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
    map("n", "K", vim.lsp.buf.hover, "Hover docs")
    map("n", "<leader>lR", "<cmd>LspRestart<CR>", "Restart LSP")
  end,
})
