return{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            highlight = highlight,
            char = "▏",
            smart_indent_cap = true,
            priority = 1,
        },
        scope = {enabled = true},
    }
}
