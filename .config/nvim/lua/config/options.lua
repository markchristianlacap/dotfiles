-- General editor settings
local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.showmode = false

-- Files
opt.swapfile = false
opt.undofile = true
opt.backspace = "indent,eol,start"

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Indentation
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
