vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.wrap = false
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.splitright = true
opt.splitbelow = true

opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300

