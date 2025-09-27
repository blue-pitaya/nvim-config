return {
	--- @deprecated
	enable = function()
		vim.lsp.config("jdtls", {
			on_attach = function(client, _)
				-- disable syntax highlight from tsserver (treesitter is preffered)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})
		vim.lsp.enable("jdtls")
	end,
}
