vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local function map(mode, lhs, rhs, desc)
  keymap(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
end

-- Basics
map("i", "jk", "<ESC>", "Better escape")
map("n", "<leader><leader>", "<cmd>nohlsearch<CR>", "Clear highlight")

-- Movement
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")
map("n", "<A-j>", ":m .+1<CR>==", "Move line down")
map("n", "<A-k>", ":m .-2<CR>==", "Move line up")
map("n", "J", "mzJ`z", "Join lines")
map("n", "n", "nzzzv", "Center search results")
map("n", "N", "Nzzzv", "Center search results")

-- Clipboard
map("x", "<leader>p", [["_dP]], "Paste without losing original content")
map({ "n", "v" }, "<leader>y", [["+y]], "Copy to clipboard")
map("n", "<leader>Y", [["+Y]], "Copy line to clipboard")
map({ "n", "v" }, "<leader>d", [["_d]], "Delete without losing original content")

-- Navigation
map("n", "<C-d>", "<C-d>zz", "Scroll down and center")
map("n", "<C-u>", "<C-u>zz", "Scroll up and center")
map("v", ">", ">gv", "Indent and stay in visual")
map("v", "<", "<gv", "Unindent and stay in visual")

-- Buffer management
map("n", "<leader>c", "<cmd>bd<CR>", "Close buffer")
map("n", "<leader>bC", "<cmd>bufdo bd<CR>", "Close all buffers")
map("n", "<leader>bc", "<cmd>%bd|e#<CR>", "Close other buffers")

-- Splits
map("n", "<leader>sv", "<cmd>vsplit<CR>", "Vertical split")
map("n", "<leader>sh", "<cmd>split<CR>", "Horizontal split")

-- Save / Quit
map("n", "<leader>w", "<cmd>w<CR>", "Save file")
map("n", "<leader>q", "<cmd>q<CR>", "Quit window")
map("n", "<leader>wq", "<cmd>wq<CR>", "Save and quit")

