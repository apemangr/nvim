------------------------------------------------------------------------------
--
--
--      ##    ## ######## ##    ## ##     ##    ###    ########   ######
--      ##   ##  ##        ##  ##  ###   ###   ## ##   ##     ## ##    ##
--      ##  ##   ##         ####   #### ####  ##   ##  ##     ## ##
--      #####    ######      ##    ## ### ## ##     ## ########   ######
--      ##  ##   ##          ##    ##     ## ######### ##              ##
--      ##   ##  ##          ##    ##     ## ##     ## ##        ##    ##
--      ##    ## ########    ##    ##     ## ##     ## ##         ######
--
--
-------------------------------------------------------------------------------

local keymap = vim.keymap.set
local s = { silent = true }
local builtin = require("telescope.builtin")
local opts = { noremap = true, silent = true }
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
keymap("n", "<leader>w", "<cmd>w!<CR>", s) -- Save the current file
keymap("n", "<leader>q", "<cmd>q<CR>", s) -- Quit Neovim
keymap("n", "<leader>te", "<cmd>tabnew<CR>", s) -- Open a new tab
keymap("n", "<leader>fo", ":lua vim.lsp.buf.format()<CR>", s) -- Format the current buffer using LSP
keymap("v", "<leader>p", '"_dP') -- Paste without overwriting the default register
keymap("x", "y", [["+y]], s) -- Yank to the system clipboard in visual mode
keymap("t", "<Esc>", "<C-\\><C-N>") -- Exit terminal mode

keymap("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Go to definition

keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", s)

keymap("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
keymap("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
keymap("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })

-- keymap("n", "gD", vim.lsp.buf.declaration)
-- keymap("n", "gd", vim.lsp.buf.definition)
-- keymap("n", "K", vim.lsp.buf.hover)
-- keymap("n", "gi", vim.lsp.buf.implementation)

-- Buffer mappings
keymap("n", "<leader>l", "<cmd>bNext<CR>", { desc = "Move to the next buffer" })
keymap("n", "<leader>h", "<cmd>bprevious<CR>", { desc = "Move to the previous buffer" })
keymap(
	"n",
	"<leader>bc",
	"<CMD>bp<bar>sp<bar>bn<bar>bd!<CR>",
	{ desc = "Close the current buffer" }
)

keymap("n", "<leader>bf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

keymap("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, s)

-- Window movement
keymap("n", "<C-l>", "<C-w>l", { desc = "Move window focus to the right" })
keymap("n", "<C-h>", "<C-w>h", { desc = "Move window focus to the left" })
keymap("t", "<C-l>", "<C-w>l", { desc = "Move window focus to the right" })
keymap("t", "<C-h>", "<C-w>h", { desc = "Move window focus to the left" })
