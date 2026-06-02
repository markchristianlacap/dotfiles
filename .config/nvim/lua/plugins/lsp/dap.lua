local dap = require("dap")
local dapui = require("dapui")

dap.adapters.coreclr = {
  type = "executable",
  command = "netcoredbg",
  args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "Launch .NET project",
    request = "launch",
    preLaunchTask = function()
      vim.cmd("silent! write")
      local result = vim.fn.system("dotnet build --nologo -q 2>&1")
      if vim.v.shell_error ~= 0 then
        vim.notify("Build failed:\n" .. result, vim.log.levels.ERROR)
        return false
      end
      vim.notify("Build succeeded", vim.log.levels.INFO)
    end,
    program = function()
      local csproj = vim.fn.glob("*.csproj", false, true)
      if #csproj == 0 then
        csproj = vim.fn.glob("*/*.csproj", false, true)
      end
      if #csproj > 0 then
        local name = vim.fn.fnamemodify(csproj[1], ":t:r")
        return vim.fn.getcwd() .. "/bin/Debug/" .. name
      end
      return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
    end,
    cwd = "${workspaceFolder}",
  },
}

for _, lang in ipairs({ "cs", "csharp" }) do
  dap.configurations[lang] = dap.configurations.cs
end

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        { id = "scopes",      size = 0.33 },
        { id = "breakpoints", size = 0.17 },
        { id = "stacks",      size = 0.5 },
      },
      size = 50,
      position = "left",
    },
    {
      elements = {
        { id = "repl",    size = 0.5 },
        { id = "console", size = 0.5 },
      },
      size = 12,
      position = "bottom",
    },
  },
})

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue/start" })
vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to cursor" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>dr", function()
  dap.repl.toggle({}, "belowright")
end, { desc = "Toggle REPL" })
vim.keymap.set("n", "<leader>dK", dap.up, { desc = "Up stack frame" })
vim.keymap.set("n", "<leader>dJ", dap.down, { desc = "Down stack frame" })

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close
