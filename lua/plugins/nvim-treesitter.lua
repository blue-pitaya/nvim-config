return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
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
				"razor",
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

		--local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		--parser_config.j2 = {
		--	install_info = {
		--		url = "~/packages/ts-grammars/tree-sitter-jinja2", -- local path or git repo
		--		files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
		--		-- optional entries:
		--		branch = "main", -- default branch in case of git repo if different from master
		--		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		--		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
		--	},
		--	filetype = "j2", -- if filetype does not match the parser name
		--}

		vim.treesitter.language.register("php", "j2")
		vim.treesitter.language.register("html", "blade")
		vim.treesitter.language.register("html", "htmldjango")
	end,
}
