-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Utility for simpler mappings
local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Basics
map("i", "jk", "<ESC>", "Escape insert mode")
map("n", "<leader><leader>", "<cmd>nohlsearch<CR>", "Clear search highlight")
map("n", "<ESC>", "<cmd>nohlsearch<CR>", "Clear search highlight")

-- Better indenting
map("v", "<", "<gv", "Indent less with visual stay")
map("v", ">", ">gv", "Indent more with visual stay")

-- Move lines / selections
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")
map("n", "<A-j>", ":m .+1<CR>==", "Move line down")
map("n", "<A-k>", ":m .-2<CR>==", "Move line up")
map("n", "J", "mzJ`z", "Join lines without scrolling")

-- Search navigation (center results)
map("n", "n", "nzzzv", "Next search result centered")
map("n", "N", "Nzzzv", "Previous search result centered")
map("n", "*", "*zz", "Search word under cursor centered")
map("n", "#", "#zz", "Search word backward centered")

-- Clipboard operations
map("x", "<leader>p", [["_dP]], "Paste without deleting to register")
map({ "n", "v" }, "<leader>y", [["+y]], "Yank to system clipboard")
map("n", "<leader>Y", [["+Y]], "Yank line to system clipboard")
map({ "n", "v" }, "<leader>d", [["_d]], "Delete without yanking")

-- Scrolling (center viewport)
map("n", "<C-d>", "<C-d>zz", "Scroll down half page centered")
map("n", "<C-u>", "<C-u>zz", "Scroll up half page centered")

-- Buffers
map("n", "<leader>c", "<cmd>bdelete<CR>", "Close current buffer")
map("n", "<leader>bC", "<cmd>%bdelete<CR>", "Close all buffers")
map("n", "<leader>bc", "<cmd>%bdelete|edit#<CR>", "Close other buffers")
map("n", "[b", "<cmd>bprevious<CR>", "Previous buffer")
map("n", "]b", "<cmd>bnext<CR>", "Next buffer")

-- Splits
map("n", "<leader>sv", "<cmd>vsplit<CR>", "Vertical split")
map("n", "<leader>sh", "<cmd>split<CR>", "Horizontal split")
map("n", "<C-w><C-w>", "<C-w>w", "Cycle through windows")

-- Tabs
map("n", "<leader>tn", "<cmd>tabnew<CR>", "New tab")
map("n", "<leader>tc", "<cmd>tabclose<CR>", "Close tab")
map("n", "<leader>to", "<cmd>tabonly<CR>", "Close other tabs")
map("n", "]t", "<cmd>tabnext<CR>", "Next tab")
map("n", "[t", "<cmd>tabprevious<CR>", "Previous tab")

-- Save / Quit
map("n", "<leader>w", "<cmd>write<CR>", "Save file")
map("n", "<leader>q", "<cmd>quit<CR>", "Quit")
map("n", "<leader>wq", "<cmd>writequit<CR>", "Save and quit")
map("n", "<leader>q!", "<cmd>quit!<CR>", "Quit without saving")

-- Format
map("n", "<leader>f", function() require("utils.format").format_buffer() end, "Format buffer")
