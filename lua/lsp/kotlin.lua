return {
	-- https://github.com/Kotlin/kotlin-lsp/releases
	enable = function()
		vim.lsp.config("kotlin_lsp", {
			on_attach = function(client, _)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})
		vim.lsp.enable("kotlin_lsp")
	end,
}
