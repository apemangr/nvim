return{
    "gmr458/vscode_modern_theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("vscode_modern").setup({
            cursorline = true,
            transparent_background = false,
            nvim_tree_darker = true,
            custom_dark_background = "#151515",
            custom_statusline_dark_background = "#0b0b0b",

        })
        vim.cmd.colorscheme("vscode_modern")
        vim.cmd("hi MatchParen gui=bold guifg=Yellow guibg=NONE")
        vim.cmd("hi FoldColumn guifg=Gray guibg=NONE")
        vim.api.nvim_set_hl(0, 'Explorer', { fg = '#74dcfe', bg = '#181818' })
    end,
}
