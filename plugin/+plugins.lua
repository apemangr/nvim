-- Plugins config



------------
--
-- Nvim-tree
--
------------

vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

require("nvim-tree").setup()

-- Nvimtree ends here



------------
--
-- Telescope
--
------------

vim.pack.add({
    { src = "https://github.com/nvim-telescope/telescope.nvim", opt = false },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
})

vim.cmd.packadd("telescope.nvim")

require('telescope').setup {
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            preview_width = 0.7,
            width = 0.99,
            height = 0.99,
            preview_cutoff = 0, -- nunca esconder preview
            prompt_position = "bottom",
        },
    }
}

-- Telescope ends here



------------
--
-- blink.cmp
-- 
------------

vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
       signature = { enabled = true },
    keymap = {
        preset = "default",
        ["<C-space>"] = { "hide" },
        ["<Tab>"] = {},
        ["<CR>"]  = {"accept", "fallback"},
        ["<S-Tab>"] = {},
        ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_down", "fallback" },
        ["<C-f>"] = { "scroll_documentation_up", "fallback" },
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
    },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },
    completion = {
        documentation = {
            auto_show = false,
            auto_show_delay_ms = 200,
        },
        menu = {
            auto_show = true,
        },
        trigger = {
            show_on_insert = true, -- Muestra el menú al entrar en modo de inserción
            show_on_keyword = true, -- Muestra el menú al escribir una palabra clave
        },
    },

    cmdline = {
        keymap = {
            preset = 'inherit',
            ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
    },

    sources = { default = { "lsp", "buffer" } }
})

-- blink.cmp ends here



--------
--
-- Mason
--
--------

vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup({})

-- Mason ends here



-----------------------
--
-- Colorscheme: OneDark 
--
-----------------------

vim.pack.add({
    { src = "https://github.com/navarasu/onedark.nvim" },
})


require('onedark').setup {
    style = 'warmer',
    highlights = {
        NvimTreeWinSeparator = { fg = '#232326', bg = '#232326' },
  }

}

require('onedark').load()

-- Colorscheme: OneDrak ends here



-----------
--
-- Gitsigns
--
-----------

vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}

--- GitSigns ends here


