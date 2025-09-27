return {
	--- sudo pacman -S gopls delve
	enable = function()
		vim.lsp.enable("gopls")
	end,
}
