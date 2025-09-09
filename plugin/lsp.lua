-- ~/.config/nvim-new/plugin/lsp.lua
vim.lsp.enable({
	"lua_ls",
	"clangd",
})
vim.diagnostic.config({ virtual_text = true })
