return{
    'akinsho/bufferline.nvim', 
    version = "*",
    config = function()
        require("bufferline").setup{
            options = { 
                numbers = function(opts)
                    return string.format('%s.', opts.ordinal)
                end,

                style_preset = require('bufferline').style_preset.no_italic,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "VisualNC",
                        --separator = " "
                    }
                },
                indicator = {
                    style = 'none'
                },
                buffer_close_icon = '',
                close_icon = '',
            }
        }
    end
}
