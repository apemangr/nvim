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
-- Change directory to the current file's directory
keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')

local opts = { noremap = true, silent = true }
keymap("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Go to definition

keymap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", s)

local builtin = require('telescope.builtin')
keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


local function safe_cnext()
  local qf = vim.fn.getqflist({idx = 0, size = 0})
  if qf.idx < qf.size then
    vim.cmd("cnext")
  else
    print("Ya estás en el último item de la quickfix")
  end
end

local function safe_cprev()
  local qf = vim.fn.getqflist({idx = 0})
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


keymap("v", "<leader>s", function()
  -- obtener solo la selección
  local search = vim.fn.getreg('v')
  local escaped = vim.fn.escape(search, '/\\')
  vim.cmd("vimgrep /" .. escaped .. "/ **/* | copen")
end, { desc = "Buscar selección en quickfix" })

