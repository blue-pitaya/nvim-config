return {
	--- require: sudo pacman -S dotnet-sdk
	enable = function()
		local home = os.getenv("HOME")

		vim.lsp.config("roslyn_ls", {
			cmd = {
				home
					.. "/packages/lsp/roslyn_ls/content/LanguageServer/linux-x64/Microsoft.CodeAnalysis.LanguageServer",
				"--logLevel", -- this property is required by the server
				"Information",
				"--extensionLogDirectory", -- this property is required by the server
				"/tmp/roslyn_ls/logs",
				"--stdio",
			},
		})
		vim.lsp.enable("roslyn_ls")
	end,
}
