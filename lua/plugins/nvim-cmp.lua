return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
    },
    config = function()
        local cmp = require'cmp'
        local luasnip = require'luasnip'
        local lspkind = require("lspkind")

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For luasnip users.
                end,
            },
            formatting = {

                fields = {'kind', 'abbr', 'menu'},
                expandable_indicator = true,
                format = lspkind.cmp_format({
                    mode = 'text_symbol',
                    maxwidth = 40,
                    ellipsis_char = '...',
                    show_labelDetails = false,
                    before = function (_, vim_item)
                        local kind = vim_item.kind
                        vim_item.kind = lspkind.presets.codicons[vim_item.kind] or " "
                        vim_item.menu = kind
                        return vim_item
                    end
                })},
            window = {
                completion = cmp.config.window.bordered({
                    --border = "none",
                    side_padding = 1,
                    col_offset = -5,
                }),
                documentation = cmp.config.window.bordered({

                }),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp_signature_help' },
                { name = 'nvim_lsp' },
                { name = 'luasnip'},
                { name = 'obsidian' },
                { name = 'codeium' },
            }, {
                { name = 'buffer' },
            })
        })
    end
}
