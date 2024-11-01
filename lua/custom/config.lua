vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.number = true
vim.opt.conceallevel = 2
vim.opt.shada = ""
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
--vim.o.signcolumn = "yes:2"
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.fileencoding = "utf-8"
vim.o.encoding = "utf-8"
vim.o.laststatus = 2
vim.opt.swapfile = false
vim.o.guifont = "JetBrains Mono:h10"
vim.o.fillchars = [[eob: ]]

-- Neovide
if vim.g.neovide then
    vim.o.guifont = "JetBrains Mono:h11:#e-subpixelantialias:#h-none"
end
