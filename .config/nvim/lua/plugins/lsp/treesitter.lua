return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
            -- Disable for specific languages that have issues
            return vim.tbl_contains({ "c", "rust" }, lang)
          end,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
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
          "dockerfile",
          "gitignore",
          "c",
          "vue",
          "c_sharp",
        },
      }
    end,
  },
}
