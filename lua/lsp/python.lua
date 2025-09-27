return {
	--- require: pipx install basedpyright
	--- require: sudo pacman -S ruff
	enable = function()
		vim.lsp.config("basedpyright", {
			settings = {
				basedpyright = {
					typeCheckingMode = "basic",
					disableOrganizeImports = true,
					disableTaggedHints = false,
					analysis = {
						useLibraryCodeForTypes = true, -- Analyze library code for type information
						autoImportCompletions = true,
						autoSearchPaths = true,
					},
				},
			},
		})
		vim.lsp.enable("basedpyright")

		vim.lsp.config("ruff", {
			on_attach = function(client, _)
				if client.name == "ruff_lsp" then
					-- Disable hover in favor of Pyright
					client.server_capabilities.hoverProvider = false
				end
			end,
		})
		vim.lsp.enable("ruff")
	end,
}
