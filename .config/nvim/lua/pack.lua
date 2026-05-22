vim.pack.add({
  "https://github.com/bluz71/vim-moonfly-colors",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/romus204/tree-sitter-manager.nvim",
  "https://github.com/monkoose/neocodeium",
  "https://github.com/seblyng/roslyn.nvim",
  "https://github.com/mrjones2014/smart-splits.nvim"
})

---- mini files ----
local MiniFiles = require("mini.files")
MiniFiles.setup({
  mappings = {
    synchronize = "w",
    go_in_plus = "<CR>",
  },
})
vim.keymap.set("n", "e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })

---- mini notify ----
require("mini.notify").setup({
  -- only show messages
  content = {
    format = function(notif)
      return notif.msg
    end,
  },
})

--- mini cmdline completion ---
require("mini.cmdline").setup()

--- mini surround ---
require("mini.surround").setup()
-- Default Keymaps
-- | `sa` | Add surrounding or Direct with 'saiw' |
-- | `sd` | Delete surrounding |
-- | `sr` | Replace surrounding |
-- | `sf` | Find surrounding (right) |
-- | `sF` | Find surrounding (left) |
-- | `sh` | Highlight surrounding |
-- | `sn` | Update n_lines |
-- | `l` / `n` | as suffix for prev/next |

--- mini picker ---
local MiniExtra = require("mini.extra")
local MiniPick = require("mini.pick")
MiniPick.setup()
MiniExtra.setup()

-- keymaps
vim.keymap.set("n", "<leader>ff", function()
  MiniPick.builtin.files()
end, { desc = "Mini File Picker" })
vim.keymap.set("n", "<leader>fw", function()
  MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end, { desc = "Grep word/Search word" })
vim.keymap.set("n", "<leader>fh", function()
  MiniPick.builtin.help()
end, { desc = "Mini Help" })

vim.keymap.set("n", "<leader>fd", function()
  MiniExtra.pickers.diagnostic()
end, { desc = "Mini Picker Diagnostics" })
vim.keymap.set("n", "<leader>fk", function()
  MiniExtra.pickers.keymaps()
end, { desc = "Search keymaps" })

--- mini completions ---
require("mini.completion").setup({
  lsp_completion = {
    auto_setup = true,
  },
})

--- mini snippets ---
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
  snippets = {
    MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets
  },
})
MiniSnippets.start_lsp_server({ match = false })

--- mini diff and fugitive ---
local MiniDiff = require("mini.diff")
MiniDiff.setup({
  source = MiniDiff.gen_source.git({ index = false }),
})

vim.keymap.set("n", "<leader>gg", "<cmd>tabnew | Git | only<cr>", { desc = "Fugitive Full Page New Tab" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git diff split" })

--- mini comment ---
require("mini.comment").setup()

--- mini pairs ---
require('mini.pairs').setup()

--- mini clue ---
require('mini.clue').setup()

--- mini indentscope ---
require('mini.indentscope').setup()

--- mini statusline ---
require('mini.statusline').setup()

--- mini animate ---
require("mini.animate").setup()

--- treesitter ---
require("tree-sitter-manager").setup({
  auto_install = true,
})

--- neocodeium ---
local neocodeium = require("neocodeium")
neocodeium.setup()
vim.keymap.set("i", "<C-g>", neocodeium.accept)

--- smart splits ---
local SmartSplits = require("smart-splits")
SmartSplits.setup()
vim.keymap.set('n', '<A-h>', SmartSplits.resize_left)
vim.keymap.set('n', '<A-j>', SmartSplits.resize_down)
vim.keymap.set('n', '<A-k>', SmartSplits.resize_up)
vim.keymap.set('n', '<A-l>', SmartSplits.resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', SmartSplits.move_cursor_left)
vim.keymap.set('n', '<C-j>', SmartSplits.move_cursor_down)
vim.keymap.set('n', '<C-k>', SmartSplits.move_cursor_up)
vim.keymap.set('n', '<C-l>', SmartSplits.move_cursor_right)
vim.keymap.set('n', '<C-\\>', SmartSplits.move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', SmartSplits.swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', SmartSplits.swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', SmartSplits.swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', SmartSplits.swap_buf_right)
