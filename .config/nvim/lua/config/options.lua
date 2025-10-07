-- ==========================================
-- 🧩 General Options
-- ==========================================
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.swapfile = false
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- UI
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.showmode = false
