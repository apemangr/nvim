---------------------------------------------------------------------------------------------------
--
--                 ########  ##       ##     ##  ######   #### ##    ##  ######
--                 ##     ## ##       ##     ## ##    ##   ##  ###   ## ##    ##
--                 ##     ## ##       ##     ## ##         ##  ####  ## ##
--                 ########  ##       ##     ## ##   ####  ##  ## ## ##  ######
--                 ##        ##       ##     ## ##    ##   ##  ##  ####       ##
--                 ##        ##       ##     ## ##    ##   ##  ##   ### ##    ##
--                 ##        ########  #######   ######   #### ##    ##  ######
--
---------------------------------------------------------------------------------------------------

-- {{ Nvim-Tree -----------------------------------------------------------------------------------

vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-tree.lua", confirm = false },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons", confirm = false },
})

require("nvim-tree").setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
})

-- }} Nvim-Tree ends here -------------------------------------------------------------------------

-- {{ Telescope -----------------------------------------------------------------------------------

vim.pack.add({
	{ src = "https://github.com/nvim-telescope/telescope.nvim", opt = false, confirm = false },
	{ src = "https://github.com/nvim-lua/plenary.nvim", confirm = false },
})

vim.cmd.packadd("telescope.nvim")

require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			preview_width = 0.7,
			width = 0.99,
			height = 0.99,
			preview_cutoff = 0, -- nunca esconder preview
			prompt_position = "bottom",
		},
	},
})

-- }} Telescope ends here -------------------------------------------------------------------------

-- {{ blink.cmp -----------------------------------------------------------------------------------

vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
		confirm = false,
	},
})

require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		["<C-space>"] = { "hide" },
		["<Tab>"] = {},
		["<CR>"] = { "accept", "fallback" },
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
			show_on_insert = false,
			show_on_keyword = true,
		},
	},

	cmdline = {
		keymap = {
			preset = "inherit",
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
	},

	sources = { default = { "lsp", "buffer", "snippets" } },
	snippets = { preset = "luasnip" },
})

-- }} blink.cmp ends here -------------------------------------------------------------------------

-- {{ Mason ---------------------------------------------------------------------------------------

vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim", confirm = false },
})

require("mason").setup({})

-- }} Mason ends here -----------------------------------------------------------------------------

-- {{ Colorscheme: OneDark ------------------------------------------------------------------------

vim.pack.add({
	{ src = "https://github.com/navarasu/onedark.nvim", confirm = false },
})

require("onedark").setup({
	style = "warmer",
	highlights = {
		NvimTreeWinSeparator = { fg = "#232326", bg = "#232326" },
	},
})

require("onedark").load()

-- }} Colorscheme: OneDrak ends here --------------------------------------------------------------

-- {{ Gitsigns ------------------------------------------------------------------------------------

vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim", confirm = false },
})

require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged_enable = true,
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = false, -- Toggle `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
	sign_priority = 10,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})

-- }} GitSigns ends here --------------------------------------------------------------------------

-- {{ Treesitter ----------------------------------------------------------------------------------

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", confirm = false },
})

require("nvim-treesitter.install").compilers = { "clang", "gcc" }

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"python",
		"javascript",
		"typescript",
		"c",
		"cpp",
		"printf",
	},
	highlight = {
		enable = true, -- activa resaltado de sintaxis
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true }, -- indentación automática opcional
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})

vim.cmd.packadd("nvim-treesitter")

-- }} Treesitter ends here ------------------------------------------------------------------------

-- {{ Conform -------------------------------------------------------------------------------------

vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim", confirm = false },
})

require("conform").setup({
	formatters_by_ft = {
		cpp = { "clang_format" },
		c = { "clang_format" },
		lua = { "stylua" },
		python = { "isort", "black" },
	},
	formatters = {
		clang_format = {
			prepend_args = { "--style=file" },
		},
		stylua = {
			prepend_args = { "--column-width", "100" },
		},
	},
})

vim.cmd.packadd("conform.nvim")

-- }} Conform ends here ---------------------------------------------------------------------------

-- {{ nvim-treesitter-context ---------------------------------------------------------------------

vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-context",
		on_bufread = true,
		confirm = false,
	},
})

require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	multiwindow = false, -- Enable multiwindow support.
	max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to show for a single context
	trim_scope = "inner", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = "─",
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})

-- }} nvim-treesitter-context ends here -----------------------------------------------------------

-- {{ Luasnip -------------------------------------------------------------------------------------

vim.pack.add({
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
})

vim.cmd.packadd("LuaSnip")

local luasnip = require("luasnip")

luasnip.config.set_config({
	history = true,
	delete_check_events = "TextChanged",
	updateevents = "TextChanged,TextChangedI",
	region_check_events = "CursorMoved,CursorMovedI",
	store_selection_keys = "<Tab>",
})

-- Configurar el directorio de snippets
local snippet_dir = vim.fn.stdpath("config") .. "/snippets"

-- Cargar snippets
require("luasnip.loaders.from_lua").lazy_load({ paths = snippet_dir })

-- mappings coherentes con tu blink.cmp (<C-l> forward, <C-h> back)
vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })

-- }} Luasnip ends here ---------------------------------------------------------------------------

-- {{ Which-Key -----------------------------------------------------------------------------------

vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim", confirm = false },
})

require("which-key").setup({
	preset = "modern",
	delay = function(ctx)
		return ctx.plugin and 0 or 500
	end,
	filter = function(mapping)
		-- example to exclude mappings without a description
		return mapping.desc and mapping.desc ~= ""
	end,
	spec = {
		{ "<leader>f", group = "find" },
		{ "<leader>g", group = "git" },
		{ "<leader>l", group = "lsp" },
		{ "<leader>t", group = "toggle" },
		{ "<leader>w", group = "window" },
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
})

-- }} Which-Key ends here -------------------------------------------------------------------------
