return {
	--- require: sudo pacman -S typescript typescript-language-server
	enable = function()
		vim.lsp.config("ts_ls", {
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						-- TODO: remove vue
						location = "~/.local/lib/node_modules/@vue/typescript-plugin/lib",
						languages = { "typescript" },
					},
				},
			},
			on_init = function(client, _)
				-- disable syntax highlight from tsserver (treesitter is preffered)
				client.server_capabilities.semanticTokensProvider = nil
			end,
			filetypes = {
				"javascript",
				"typescript",
				"vue",
				"typescriptreact",
				"javascripttreact",
			},
		})
		vim.lsp.enable("ts_ls")
	end,
}
