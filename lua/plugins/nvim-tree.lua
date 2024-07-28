return{
    "nvim-tree/nvim-tree.lua",
    keys = {{"<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree"}},
    config =  function()
        require("nvim-tree").setup{
            view = {
                preserve_window_proportions = true,
            },
            git = {
                enable = false,
                ignore = false,
            },
            update_cwd = true,
            update_focused_file = {
                enable = true,
                update_cwd = false, 
            },
            renderer = {
                group_empty = true,
                root_folder_label = false,
                indent_markers = {
                    enable = true,
                    icons = {
                        corner = "└",
                        edge = "│",
                        item = "│",
                        none = " "
                    }
                },
                icons = {
                    show = {
                        file = true, 
                        git = false,
                    },
                    glyphs = {
                        default = "📃",
                        folder = {
                            arrow_closed = "▶",
                            arrow_open = "▽",
                            default = "📁",
                            open = "📂",
                            empty = "📁",
                            empty_open = "📂",
                            symlink = "📁",
                            symlink_open = "📂"
                        }
                    }
                }
            }
        }
    end,
}
