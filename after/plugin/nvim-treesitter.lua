require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"css",
		"go",
		"haskell",
		"html",
		"java",
		"javascript",
		"lua",
		"perl",
		"php",
		"python",
		"query",
		"rust",
		"scala",
		"tsx",
		"typescript",
		"vim",
		"zig",
	},
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,
	highlight = {
		enable = true,
		--disable = { "php" },
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false,
		disable = { "php" },
	},
})

-- Treat vue files as html for correct syntax highligh in single file components in vue.js
vim.treesitter.language.register("html", "vue")

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
---@diagnostic disable-next-line: inject-field
parser_config.blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade",
		files = { "src/parser.c" },
		branch = "v0.9.2",
	},
	filetype = "blade",
}
