return {
    -- require: sudo pacman -S dotnet-sdk
	enable = function()
		local home = os.getenv("HOME")
		vim.lsp.config("roslyn_ls", {
			-- This line in required for proper UTF-8 chars handling like (ą,ę,ź,...)
			offset_encoding = "utf-16",
			cmd = {
				home
					.. "/packages/lsp/roslyn_ls/content/LanguageServer/linux-x64/Microsoft.CodeAnalysis.LanguageServer",
				-- This property is required by the server
				"--logLevel",
				"Information",
				-- This property is required by the server
				"--extensionLogDirectory",
				"/tmp/roslyn_ls/logs",
				"--stdio",
			},
			handlers = {
				["textDocument/semanticTokens/full"] = function() end,
				["textDocument/semanticTokens/range"] = function() end,
			},
		})
		vim.lsp.enable("roslyn_ls")
	end,
}
