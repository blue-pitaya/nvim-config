return {
	--- sudo pacman -S clang
	enable = function()
		vim.lsp.config("clangd", {
			on_attach = function(client, _)
				-- disable syntax highlight from tsserver (treesitter is preffered)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})
		vim.lsp.enable("clangd")
	end,
}
