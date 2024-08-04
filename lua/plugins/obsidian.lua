return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        completion = {
            nvim_cmp = true,
            min_chars = 1,
        },
        templates = {
            folder = "5-Templates",
            date_format = "%d-%B-%Y",
            time_format = "%H:%M",
        },
        workspaces = {
            {
                name = "personal",
                path = "C:\\Users\\apemangr\\OneDrive - mail.pucv.cl\\Obsidian",
            },
        },
        disable_frontmatter = true,
        notes_subdir = "6-Full Notes",
    },
}
