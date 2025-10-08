-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Utility for simpler mappings
local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Basics
map("i", "jk", "<ESC>", "Escape insert")
map("n", "<leader><leader>", "<cmd>nohlsearch<CR>", "Clear highlight")

-- Move lines / selections
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move up")
map("n", "<A-j>", ":m .+1<CR>==", "Move line down")
map("n", "<A-k>", ":m .-2<CR>==", "Move line up")
map("n", "J", "mzJ`z", "Join lines")
map("n", "n", "nzzzv", "Center search")
map("n", "N", "Nzzzv", "Center search")

-- Clipboard
map("x", "<leader>p", [["_dP]], "Paste keep")
map({ "n", "v" }, "<leader>y", [["+y]], "Yank")
map("n", "<leader>Y", [["+Y]], "Yank line")
map({ "n", "v" }, "<leader>d", [["_d]], "Delete keep")

-- Navigation
map("n", "<C-d>", "<C-d>zz", "Scroll down")
map("n", "<C-u>", "<C-u>zz", "Scroll up")
map("v", ">", ">gv", "Indent stay")
map("v", "<", "<gv", "Unindent stay")

-- Buffers
map("n", "<leader>c", "<cmd>bd<CR>", "Close buffer")
map("n", "<leader>bC", "<cmd>bufdo bd<CR>", "Close all")
map("n", "<leader>bc", "<cmd>%bd|e#<CR>", "Close others")

-- Splits
map("n", "<leader>sv", "<cmd>vsplit<CR>", "Split vertical")
map("n", "<leader>sh", "<cmd>split<CR>", "Split horizontal")

-- Save / Quit
map("n", "<leader>w", "<cmd>w<CR>", "Save")
map("n", "<leader>q", "<cmd>q<CR>", "Quit")
map("n", "<leader>wq", "<cmd>wq<CR>", "Save and quit")
