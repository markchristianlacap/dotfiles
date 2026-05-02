return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<A-H>",
      function() require("smart-splits").resize_left() end,
      desc = "Resize split left",
    },
    {
      "<A-J>",
      function() require("smart-splits").resize_down() end,
      desc = "Resize split down",
    },
    {
      "<A-K>",
      function() require("smart-splits").resize_up() end,
      desc = "Resize split up",
    },
    {
      "<A-L>",
      function() require("smart-splits").resize_right() end,
      desc = "Resize split right",
    },
    {
      "<C-h>",
      function() require("smart-splits").move_cursor_left() end,
      desc = "Move cursor left",
    },
    {
      "<C-j>",
      function() require("smart-splits").move_cursor_down() end,
      desc = "Move cursor down",
    },
    {
      "<C-k>",
      function() require("smart-splits").move_cursor_up() end,
      desc = "Move cursor up",
    },
    {
      "<C-l>",
      function() require("smart-splits").move_cursor_right() end,
      desc = "Move cursor right",
    },
    {
      "<C-\\>",
      function() require("smart-splits").move_cursor_previous() end,
      desc = "Move cursor to previous split",
    },
    { "<leader><leader>h", function() require("smart-splits").swap_buf_left() end, desc = "Swap buffer left" },
  },
}
