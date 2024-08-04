vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.number = true
--vim.opt.fillchars:append('eob: ')
vim.opt.conceallevel = 2
vim.opt.shada = ""
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes:2"
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.fileencoding = "utf-8"
vim.o.encoding = "utf-8"
vim.o.laststatus = 2
vim.opt.swapfile = false

-- UFO folding
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]


-- Term stuff
vim.opt.shell = "powershell.exe"
vim.opt.shellxquote = ""
vim.cmd([[
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
let &shellquote = ''
let &shellpipe = '| Out-File -Encoding UTF8 %s'
let &shellredir = '| Out-File -Encoding UTF8 %s'
]])

