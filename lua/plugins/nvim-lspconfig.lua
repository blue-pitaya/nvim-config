return {
	"neovim/nvim-lspconfig",
	config = function()
		require("lsp.lua").enable()
		require("lsp.php").enable()
		require("lsp.python").enable()
		require("lsp.rust").enable()
		require("lsp.typescript").enable()
	end,
}
