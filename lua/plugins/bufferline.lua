return{
    'akinsho/bufferline.nvim', 
    version = "*",
    config = function()
        require("bufferline").setup{
            highlights = {
--                fill = {
--                    fg = "#131313",
--                    bg = "#0f0f0f",
--                },
--                buffer_selected = {
--                    fg = "#d4d4d4",
--                    bg = "#1f1f1f",
--                    bold = true,
--                },
--                background = {
--                    fg = "#808080",
--                    bg = "#131313",
--                },
--                tab = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                tab_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                tab_separator = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                tab_separator_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                    sp = '#131313',
--                },
--                tab_close = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                close_button = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                close_button_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                close_button_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                buffer_visible = {
--                    fg = "#d4d4d4",
--                    bg = "#131313",
--                }, 
--                numbers = {
--                    fg = '#252525',
--                    bg = '#131313',
--                },
--                numbers_visible = {
--                    fg = '#569cd6',
--                    bg = '#131313',
--                },
--                numbers_selected = {
--                    fg = '#569cd6',
--                    bg = '#1f1f1f',
--                },
--                diagnostic = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                diagnostic_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                diagnostic_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                hint = {
--                    fg = '#131313',
--                    sp = '#131313',
--                    bg = '#131313',
--                },
--                hint_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                hint_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                    sp = '#131313',
--                },
--                hint_diagnostic = {
--                    fg = '#131313',
--                    sp = '#131313',
--                    bg = '#131313',
--                },
--                hint_diagnostic_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                hint_diagnostic_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                    sp = '#131313',
--                },
--                info = {
--                    fg = '#131313',
--                    sp = '#131313',
--                    bg = '#131313',
--                },
--                info_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                info_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                    sp = '#131313',
--                },
--                info_diagnostic = {
--                    fg = '#131313',
--                    sp = '#131313',
--                    bg = '#131313',
--                },
--                info_diagnostic_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                info_diagnostic_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                    sp = '#131313',
--                },
--                warning = {
--                    fg = '#131313',
--                    sp = '#131313',
--                    bg = '#131313',
--                },
--                warning_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                warning_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                    sp = '#131313',
--                },
--                warning_diagnostic = {
--                    fg = '#131313',
--                    sp = '#131313',
--                    bg = '#131313',
--                },
--                warning_diagnostic_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                warning_diagnostic_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                    sp = '#131313',
--                },
--                error = {
--                    fg = '#131313',
--                    bg = '#131313',
--                    sp = '#131313',
--                },
--                error_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                error_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                    sp = '#131313',
--                },
--                error_diagnostic = {
--                    fg = '#131313',
--                    bg = '#131313',
--                    sp = '#131313',
--                },
--                error_diagnostic_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                error_diagnostic_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                    sp = '#131313',
--                },
--                modified = {
--                    fg = '#4ab97d',
--                    bg = '#131313',
--                },
--                modified_visible = {
--                    fg = '#4ab97d',
--                    bg = '#131313',
--                },
--                modified_selected = {
--                    fg = '#4ab97d',
--                    bg = '#1f1f1f',
--                },
--                duplicate_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                duplicate_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                duplicate = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                separator_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                separator_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                separator = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                indicator_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                indicator_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                pick_selected = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                pick_visible = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                pick = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                offset_separator = {
--                    fg = '#131313',
--                    bg = '#131313',
--                },
--                trunc_marker = {
--                    fg = '#131313',
--                    bg = '#131313',
--                }
            } ,
            options = { 
                numbers = function(opts)
                    return string.format('%s.', opts.ordinal)
                end,
                style_preset = require('bufferline').style_preset.no_italic,
                show_buffer_icons = false,
                show_buffer_close_icons = false,
                show_close_icon = false,
                separator_style = { '', '' },
                diagnostics_indicator = "",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Explorer",
                        highlight = "Explorer",
                        align = "left",
                        separator = " "
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
