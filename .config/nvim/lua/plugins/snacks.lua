local Snacks = require("snacks")

Snacks.setup({
  indent = {},
  image = {},
  input = {},
  lazygit = {},
  rename = {},
  scroll = {},
  scope = {},
  picker = {
    layout = "ivy_split",
  },
  notifier = {
    top_down = false,
    style = "minimal",
  },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end,
})

local picker = Snacks.picker

vim.keymap.set("n", "<leader><space>", function()
  picker.smart({ hidden = true })
end, { desc = "Smart Find Files" })

vim.keymap.set("n", "<leader>ff", function()
  picker.files({ hidden = true })
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fb", function()
  picker.buffers({ hidden = true })
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>fc", function()
  picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })

vim.keymap.set("n", "<leader>fg", function()
  picker.git_files()
end, { desc = "Find Git Files" })

vim.keymap.set("n", "<leader>fp", function()
  picker.projects()
end, { desc = "Projects" })

vim.keymap.set("n", "<leader>fo", function()
  picker.recent()
end, { desc = "Recent Files" })

vim.keymap.set("n", "<leader>fr", function()
  picker.resume()
end, { desc = "Resume Picker" })

vim.keymap.set("n", "<leader>fw", function()
  picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>:", picker.command_history, { desc = "Command History" })
vim.keymap.set("n", "<leader>s/", picker.search_history, { desc = "Search History" })
vim.keymap.set("n", "<leader>sC", picker.commands, { desc = "Commands" })
vim.keymap.set("n", "<leader>fu", picker.undo, { desc = "Undo History" })
vim.keymap.set("n", "<leader>fn", picker.notifications, { desc = "Notifications" })

vim.keymap.set("n", '<leader>fc"', picker.registers, { desc = "Registers" })
vim.keymap.set("n", "<leader>fi", picker.icons, { desc = "Icons" })
vim.keymap.set("n", "<leader>fk", picker.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fm", picker.man, { desc = "Man Pages" })

vim.keymap.set("n", "<leader>fd", picker.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fD", picker.diagnostics_buffer, { desc = "Buffer Diagnostics" })

vim.keymap.set("n", "gd", picker.lsp_definitions, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", picker.lsp_declarations, { desc = "Goto Declaration" })
vim.keymap.set("n", "gr", picker.lsp_references, { nowait = true, desc = "References" })
vim.keymap.set("n", "gI", picker.lsp_implementations, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", picker.lsp_type_definitions, { desc = "Goto Type Definition" })

vim.keymap.set("n", "gai", picker.lsp_incoming_calls, { desc = "Incoming Calls" })
vim.keymap.set("n", "gao", picker.lsp_outgoing_calls, { desc = "Outgoing Calls" })

vim.keymap.set("n", "<leader>ss", picker.lsp_symbols, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sS", picker.lsp_workspace_symbols, { desc = "Workspace Symbols" })

vim.keymap.set("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })
