-- sudo pacman -S tree-sitter-cli

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				pcall(vim.treesitter.start, ev.buf)
				-- treesitter-based indentation (experimental), returns -1 for languages without indent queries
				-- https://github.com/nvim-treesitter/nvim-treesitter#indentation
				vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
