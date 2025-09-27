return {
	--- sudo pacman -S clang
	enable = function()
		vim.lsp.enable("clangd")
	end,
}
