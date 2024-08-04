-- Deshabilitar números de línea en el modo terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', {fg = '#181818', bg = '#181818'})
    end
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.api.nvim_set_hl(0, 'BufferLineOffsetSeparator', {fg = '#181818', bg = '#181818'})
    end
})


