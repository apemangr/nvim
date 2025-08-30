-------------------------------------------------------------------------------
--
--             ######   #######  ##    ## ######## ####  ######
--            ##    ## ##     ## ###   ## ##        ##  ##    ##
--            ##       ##     ## ####  ## ##        ##  ##
--            ##       ##     ## ## ## ## ######    ##  ##   ####
--            ##       ##     ## ##  #### ##        ##  ##    ##
--            ##    ## ##     ## ##   ### ##        ##  ##    ##
--             ######   #######  ##    ## ##       ####  ######
--
-------------------------------------------------------------------------------

local opt = vim.opt
opt.colorcolumn = "100"
opt.signcolumn = "yes:2"
opt.termguicolors = true
opt.ignorecase = true
opt.swapfile = false
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.wrap = false
opt.cursorline = true
opt.scrolloff = 12
opt.inccommand = "nosplit"
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.completeopt = { "menuone", "popup", "noinsert" }
opt.winborder = "rounded"
opt.hlsearch = true
opt.clipboard = "unnamedplus"
vim.g.loader_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd.filetype("plugin indent on")

vim.o.grepprg = "rg --vimgrep --no-heading --smart-case --hidden"

if vim.fn.has("win32") == 1 then
	vim.opt.shell = "pwsh" -- o "powershell" si no tienes pwsh
	vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
	vim.opt.shellredir = ">$TEMP\\nvim_out.txt 2>&1" -- opcional, usado por algunos comandos
	vim.opt.shellpipe = "2>&1 | Tee-Object -FilePath %s -Encoding UTF8"
	vim.opt.shellquote = ""
	vim.opt.shellxquote = ""

	vim.g.python3_host_prog =
		"C:\\Users\\guill\\AppData\\Local\\Programs\\Python\\Python310\\python.exe"
end
