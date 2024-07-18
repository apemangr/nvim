return{
    "RRethy/base16-nvim",
    config = function()
        require('base16-colorscheme').with_config({
            telescope = false,
            indentblankline = true,
            notify = true,
            ts_rainbow = true,
            cmp = true,
            illuminate = true,
            dapui = true,
        })
        vim.cmd('colorscheme base16-da-one-gray')
    end
}