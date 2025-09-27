return {
	--- sudo pacman -S rust-analyzer
	enable = function()
		vim.lsp.config("rust_analyzer", {
			on_attach = function(client, bufnr)
				local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
		vim.lsp.enable("rust_analyzer")
	end,
}
