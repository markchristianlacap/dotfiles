return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    scroll = {},
    scope = {},
    input = {},
    indent = {},
    rename = {},
    words = {},
    image = {},
    notifier = {
      top_down = false,
      style = "minimal"
    },
    picker = {
      enabled = true,
      layout = "ivy_split",
      win = {
        input = {
          keys = {
            ["<C-x>"] = { "select_and_next", mode = { "i", "n" } },
          }
        }
      }
    }
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader>ff", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>fo", function() Snacks.picker.recent() end,                                  desc = "Recent" },
    { "<leader>fw", function() Snacks.picker.grep() end,                                    desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>fd", function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>fk", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>fq", function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
    { "<leader>fr", function() Snacks.picker.resume() end,                                  desc = "Resume" },
    { "<leader>fh", function() Snacks.picker.command_history() end,                         desc = "Resume" },
    { "gd",         function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",         function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gr",         function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    { "gI",         function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",         function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "gai",        function() Snacks.picker.lsp_incoming_calls() end,                      desc = "C[a]lls Incoming" },
    { "gao",        function() Snacks.picker.lsp_outgoing_calls() end,                      desc = "C[a]lls Outgoing" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
  },
}
