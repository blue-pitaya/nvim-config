return {
	-- composer global require vimeo/psalm
	enable = function()
		--vim.lsp.config("psalm", {
		--	-- Disable everything besides diagnostics
		--	on_attach = function(client, bufnr)
		--		client.server_capabilities.completionProvider = nil -- Disables completion (textDocument/completion)
		--		client.server_capabilities.hoverProvider = nil -- Disables hover (K key, textDocument/hover)
		--		client.server_capabilities.signatureHelpProvider = nil -- Disables signature help (Ctrl-S, textDocument/signatureHelp)
		--		client.server_capabilities.definitionProvider = nil -- Disables go-to-definition (Ctrl-], textDocument/definition)
		--		client.server_capabilities.referencesProvider = nil -- Disables find references (grr, textDocument/references)
		--		client.server_capabilities.documentHighlightProvider = nil -- Disables highlighting same symbols
		--		client.server_capabilities.documentSymbolProvider = nil -- Disables document symbols (gO)
		--		client.server_capabilities.codeActionProvider = nil -- Disables code actions (gra)
		--		client.server_capabilities.codeLensProvider = nil -- Disables code lens
		--		client.server_capabilities.documentFormattingProvider = nil -- Disables formatting (gq)
		--		client.server_capabilities.documentRangeFormattingProvider = nil -- Disables range formatting
		--		client.server_capabilities.renameProvider = nil -- Disables rename (grn)
		--		client.server_capabilities.typeDefinitionProvider = nil -- Disables go-to-type-definition (grt)
		--		client.server_capabilities.implementationProvider = nil -- Disables go-to-implementation (gri)
		--		client.server_capabilities.declarationProvider = nil -- Disables go-to-declaration
		--		client.server_capabilities.workspaceSymbolProvider = nil -- Disables workspace symbol search
		--		client.server_capabilities.documentLinkProvider = nil -- Disables document links
		--		client.server_capabilities.colorProvider = nil -- Disables document colors
		--		client.server_capabilities.foldingRangeProvider = nil -- Disables LSP folding
		--		client.server_capabilities.selectionRangeProvider = nil -- Disables selection range (an/in mappings)
		--		client.server_capabilities.inlayHintProvider = nil -- Disables inlay hints
		--	end,
		--})
		--vim.lsp.enable("psalm")

		-- npm i intelephense -g
		-- Config ref: https://github.com/yaegassy/coc-intelephense
		vim.lsp.config("intelephense", {
			settings = {
				intelephense = {
					files = {
						exclude = {
							"**/.git/**",
							"**/.svn/**",
							"**/.hg/**",
							"**/CVS/**",
							"**/.DS_Store/**",
							"**/node_modules/**",
							"**/bower_components/**",
							"**/vendor/**/{Tests,tests}/**",
							"**/.history/**",
							"**/vendor/**/vendor/**",
							"**/*.blade.php",
						},
					},
					diagnostics = {
						enable = true,
					},
					telemetry = {
						enabled = false,
					},
					completion = {
						parameterCase = "camel",
						propertyCase = "camel",
					},
				},
			},
		})
		vim.lsp.enable("intelephense")
	end,
}
