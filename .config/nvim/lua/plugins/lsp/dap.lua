local dap = require("dap")
local dapui = require("dapui")
local netcoredbg = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"
dapui.setup()

dap.adapters.coreclr = {
  type = "executable",
  command = netcoredbg,
  args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    request = "launch",
    name = "Launch .NET Core App",
    program = function()
      return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
    end,
    args = {},
    cwd = vim.fn.getcwd(),
    env = {
      ASPNETCORE_ENVIRONMENT = "Development",
    },
    console = "integratedTerminal",
  },
}

--breakpoint icons
vim.fn.sign_define(
  "DapBreakpoint",
  { text = "🛑", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
  "DapStopped",
  { text = "▶️", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
)

--toggle breakpoint
vim.api.nvim_set_keymap("n", "<leader>dt", ":DapToggleBreakpoint<CR>", { noremap = true })

-- start debugging
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })

--reset layout
vim.api.nvim_set_keymap("n", "<leader>dr", "<cmd>lua require('dapui').open({reset = true})<CR>", { noremap = true })

--auto open & close the UI panes
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
