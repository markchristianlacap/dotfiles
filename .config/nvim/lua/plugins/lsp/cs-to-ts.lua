return {
  {
    dir = "~/dev/projects/cs-to-ts",
    name = "cs-to-ts",
    ft = { "cs" },
    opts = {},
    keys = {
      {
        "<leader>t",
        function()
          require("cs-to-ts").copy_to_clipboard()
        end,
        desc = "Convert C# entity to TypeScript interface",
      },
    },
  },
}
