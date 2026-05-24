local MiniFiles = require("mini.files")
MiniFiles.setup({
  mappings = {
    synchronize = "w",
    go_in_plus = "<CR>",
  },
})

vim.keymap.set("n", "-", function() MiniFiles.open() end, { desc = "Toggle mini file explorer" })

vim.keymap.set("n", "<leader>e", function()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
      MiniFiles.open(path)
      MiniFiles.reveal_cwd()
    end, { desc = "Open Mini Files" })
