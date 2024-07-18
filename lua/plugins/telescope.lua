return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {"<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find Files in Telescope"},
        {"<leader>tl", "<cmd>Telescope live_grep<cr>", desc = "Live GREP in Telescope"},
        {"<leader>tb", "<cmd>Telescope buffers<cr>", desc = "List buffers in Telescope"},
    },
    config = function()
        require("telescope").setup {
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        }
    end,

}
