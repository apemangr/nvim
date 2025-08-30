---------------------------------------------------------------------------------------------------
--
--               ##    ## ######## ##    ## ##     ##    ###    ########   ######
--               ##   ##  ##        ##  ##  ###   ###   ## ##   ##     ## ##    ##
--               ##  ##   ##         ####   #### ####  ##   ##  ##     ## ##
--               #####    ######      ##    ## ### ## ##     ## ########   ######
--               ##  ##   ##          ##    ##     ## ######### ##              ##
--               ##   ##  ##          ##    ##     ## ##     ## ##        ##    ##
--               ##    ## ########    ##    ##     ## ##     ## ##         ######
--
---------------------------------------------------------------------------------------------------

-- ~/.config/nvim-new/plugin/keymaps.lua
local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "

keymap("n", "<space>", "<Nop>")

keymap("n", "j", function()
	return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true }) -- Move down, but use 'gj' if no count is given
keymap("n", "k", function()
	return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true }) -- Move up, but use 'gk' if no count is given
keymap("n", "<C-d>", "<C-d>zz") -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz") -- Scroll up and center the cursor
keymap("n", "<Leader>w", "<cmd>w!<CR>", s) -- Save the current file
keymap("n", "<Leader>q", "<cmd>q<CR>", s) -- Quit Neovim
keymap("n", "<Leader>te", "<cmd>tabnew<CR>", s) -- Open a new tab
keymap("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", s) -- Format the current buffer using LSP
keymap("v", "<Leader>p", '"_dP') -- Paste without overwriting the default register
keymap("x", "y", [["+y]], s) -- Yank to the system clipboard in visual mode
keymap("t", "<Esc>", "<C-\\><C-N>") -- Exit terminal mode

local opts = { noremap = true, silent = true }
keymap("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Go to definition

keymap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", s)

local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
keymap("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
keymap("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
keymap("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

local function safe_cnext()
	local qf = vim.fn.getqflist({ idx = 0, size = 0 })
	if qf.idx < qf.size then
		vim.cmd("cnext")
	else
		print("Ya estás en el último item de la quickfix")
	end
end

local function safe_cprev()
	local qf = vim.fn.getqflist({ idx = 0 })
	if qf.idx > 1 then
		vim.cmd("cprevious")
	else
		print("Ya estás en el primer item de la quickfix")
	end
end

-- mappings
keymap("n", "<leader>)", safe_cnext, { desc = "Quickfix next seguro" })
keymap("n", "<leader>(", safe_cprev, { desc = "Quickfix prev seguro" })
keymap("n", "<leader>fc", "<cmd>cclose<CR>", { desc = "Close Quickfix window" })

-- keymap("v", "0", function()
--   -- obtener solo la selección
--   local search = vim.fn.getreg('v')
--   local escaped = vim.fn.escape(search, '/\\')
--   vim.cmd("vimgrep /" .. escaped .. "/ **/* | copen")
-- end, { desc = "Buscar selección en quickfix" })
--

-- Buffer movement
keymap("n", "<leader>l", "<cmd>bNext<CR>", { desc = "Move to the next buffer" })
keymap("n", "<leader>h", "<cmd>bprevious<CR>", { desc = "Move to the previous buffer" })
keymap("n", "<leader>c", "<cmd>bdelete<CR>", { desc = "Close the current buffer" })

-- Window movement
keymap("n", "<C-l>", "<C-w>l", { desc = "Move window focus to the right" })
keymap("n", "<C-h>", "<C-w>h", { desc = "Move window focus to the left" })
keymap("t", "<C-l>", "<C-w>l", { desc = "Move window focus to the right" })
keymap("t", "<C-h>", "<C-w>h", { desc = "Move window focus to the left" })

keymap("v", "<leader>t", function()
	-- copiar selección al registro v (o usar +)
	vim.cmd('normal! gv"vy')

	local search = vim.fn.getreg("v")
	if not search or search == "" then
		print("Nada seleccionado")
		return
	end

	search = search:gsub("\r?\n$", "")

	if vim.fn.executable("rg") == 0 then
		print("Instala ripgrep (rg)")
		return
	end

	local stdout = {}
	local job = vim.fn.jobstart(
		{ "rg", "--vimgrep", "--no-heading", "--smart-case", "--hidden", search, "." },
		{
			stdout_buffered = true,
			on_stdout = function(_, data)
				if data then
					for _, l in ipairs(data) do
						if l ~= "" then
							table.insert(stdout, l)
						end
					end
				end
			end,
			on_exit = vim.schedule_wrap(function(_, code)
				if code ~= 0 and #stdout == 0 then
					print("No se encontraron resultados")
					return
				end
				vim.fn.setqflist({}, " ", { title = "Búsqueda rápida (rg)", lines = stdout })
				vim.cmd("copen")
			end),
		}
	)

	if job <= 0 then
		print("jobstart falló")
	end
end, { desc = "Buscar selección en quickfix rápido, sin pedir ENTER" })
