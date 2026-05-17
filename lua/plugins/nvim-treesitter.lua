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
			end,
		})

		-- TODO:
		--vim.treesitter.language.register("php", "j2")
		--vim.treesitter.language.register("html", "blade")
		--vim.treesitter.language.register("html", "htmldjango")
	end,
}
