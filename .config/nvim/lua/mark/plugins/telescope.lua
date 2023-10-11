return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    local wk = require("which-key")

        wk.register({
        f = {
            name = "File",
            f = { "<cmd>Telescope find_files<CR>", "Find file" },
            r = { "<cmd>Telescope oldfiles<CR>", "Open recent file" },
            b = { "<cmd>Telescope buffers<CR>", "Open buffer" },
            h = { "<cmd>Telescope help_tags<CR>", "Open help tags" },
            g = { "<cmd>Telescope git_files<CR>", "Open git files" },
            s = { "<cmd>Telescope live_grep<CR>", "Search in files" },
            p = { "<cmd>Telescope projects<CR>", "Open project" },
        },
       
    }, { prefix = "<leader>" })
  end,
}
