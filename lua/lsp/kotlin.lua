return {
	-- https://github.com/Kotlin/kotlin-lsp/releases
	enable = function()
		local lsp_home = vim.fn.expand("~/packages/kotlin-lsp")

		vim.lsp.config("kotlin_lsp", {
			cmd = { lsp_home .. "/kotlin-lsp.sh", "--stdio" },
			cmd_env = {
				JAVA_HOME = lsp_home .. "/jre", -- force bundled JRE
			},
			on_attach = function(client, _)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})
		vim.lsp.enable("kotlin_lsp")
	end,
}
