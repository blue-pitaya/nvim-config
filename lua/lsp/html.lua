local vscodeLangSeverCaps = vim.lsp.protocol.make_client_capabilities()
vscodeLangSeverCaps.textDocument.completion.completionItem.snippetSupport = true

return {
	--- require: npm install -g vscode-langservers-extracted
	enable = function()
		vim.lsp.config("html", {
			capabilities = vscodeLangSeverCaps,
		})
		vim.lsp.enable("html")
	end,
}
