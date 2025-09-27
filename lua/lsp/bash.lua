return {
	--- require: sudo pacman -S bash-language-server
	enable = function()
		vim.lsp.enable("bashls")
	end,
}
