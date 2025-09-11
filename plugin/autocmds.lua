---------------------------------------------------------------------------------------------------
--
--            ###    ##     ## ########  #######   ######  ##     ## ########   ######
--           ## ##   ##     ##    ##    ##     ## ##    ## ###   ### ##     ## ##    ##
--          ##   ##  ##     ##    ##    ##     ## ##       #### #### ##     ## ##
--         ##     ## ##     ##    ##    ##     ## ##       ## ### ## ##     ##  ######
--         ######### ##     ##    ##    ##     ## ##       ##     ## ##     ##       ##
--         ##     ## ##     ##    ##    ##     ## ##    ## ##     ## ##     ## ##    ##
--         ##     ##  #######     ##     #######   ######  ##     ## ########   ######
--
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 170 })
	end,
	group = highlight_group,
})


local ignore_filetypes = { 'neo-tree', 'NvimTree_1', 'NvimTree' }
local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

local augroup =
    vim.api.nvim_create_augroup('FocusDisable', { clear = true })

vim.api.nvim_create_autocmd('WinEnter', {
    group = augroup,
    callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
        then
            vim.w.focus_disable = true
        else
            vim.w.focus_disable = false
        end
    end,
    desc = 'Disable focus autoresize for BufType',
})

vim.api.nvim_create_autocmd('FileType', {
    group = augroup,
    callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.b.focus_disable = true
        else
            vim.b.focus_disable = false
        end
    end,
    desc = 'Disable focus autoresize for FileType',
})
