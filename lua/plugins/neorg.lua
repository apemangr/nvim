return {
    "nvim-neorg/neorg",
    keys = {{"<leader>n", "<Plug>(neorg.presenter.next-page)<cr>", desc = "Toggle NvimTree"}},
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.presenter"] = {
                    config = {
                        zen_mode = "zen-mode"
                    }
                },
                ["core.concealer"] = {}, -- We added this line!
            }
        })
    end

}
