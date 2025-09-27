return {
	--TODO: fill system reqs
	enable = function()
		vim.lsp.config("hls", {
			filetypes = { "haskell", "lhaskell", "cabal" },
		})
		vim.lsp.enable("hls")
	end,
}
