return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "yaml",
          "html",
          "css",
          "markdown",
          "markdown_inline",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "vue",
          "c_sharp",
          "fish"
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
      local wk = require("which-key")
    wk.register({
        g= {
            name = "LazyGit",
            g = { "<cmd>LazyGit<CR>", "Open LazyGit" },
            b = { "<cmd>LazyGitBlame<CR>", "Open LazyGitBlame" },
            c = { "<cmd>LazyGitConfig<CR>", "Open LazyGitConfig" },
            s = { "<cmd>LazyGitStash<CR>", "Open LazyGitStash" },
        }
    }, { prefix = "<leader>" })
    end,
  },
}
