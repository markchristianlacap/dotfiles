return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    dependencies = {
      { "folke/snacks.nvim", optional = true },
    },
    config = function()
      vim.g.opencode_opts = {}
      vim.o.autoread = true

      vim.keymap.set({ "n", "x" }, "<leader>oa", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask opencode" })

      vim.keymap.set({ "n", "x" }, "<leader>oo", function()
        require("opencode").select()
      end, { desc = "Opencode actions" })

      vim.keymap.set({ "n", "t" }, "<leader>og", function()
        require("opencode").toggle()
      end, { desc = "Toggle opencode" })

      vim.keymap.set({ "n", "x" }, "go", function()
        return require("opencode").operator("@this ")
      end, { expr = true, desc = "Add range to opencode" })

      vim.keymap.set("n", "goo", function()
        return require("opencode").operator("@this ") .. "_"
      end, { expr = true, desc = "Add line to opencode" })
    end,
  },
}
