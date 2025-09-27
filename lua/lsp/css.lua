local vscodeLangSeverCaps = vim.lsp.protocol.make_client_capabilities()
vscodeLangSeverCaps.textDocument.completion.completionItem.snippetSupport = true

return {
	--- require: npm install -g vscode-langservers-extracted
	enable = function()
		vim.lsp.config("cssls", {
			capabilities = vscodeLangSeverCaps,
		})
		vim.lsp.enable("cssls")
	end,
}
