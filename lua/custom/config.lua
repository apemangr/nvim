vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.number = true
vim.opt.fillchars:append('eob: ')
vim.opt.conceallevel = 2
vim.opt.shada = ""
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.fileencoding = "utf-8"
vim.o.encoding = "utf-8"
vim.o.laststatus = 3
vim.opt.swapfile = false
vim.opt.shell = "powershell.exe"
vim.opt.shellxquote = ""
vim.cmd([[
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
let &shellquote = ''
let &shellpipe = '| Out-File -Encoding UTF8 %s'
let &shellredir = '| Out-File -Encoding UTF8 %s'
]])
