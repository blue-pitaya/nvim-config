return {
	"neovim/nvim-lspconfig",
	config = function()
		-- Only color line number if diagnostic occurered on given line
		local signs = { "Error", "Warn", "Hint", "Info" }
		for _, sign in pairs(signs) do
			local hl = "DiagnosticSign" .. sign
			vim.fn.sign_define(hl, { text = "", texthl = hl, numhl = hl })
		end

		require("lsp.bash").enable()
		require("lsp.c_sharp").enable()
		require("lsp.cpp").enable()
		require("lsp.css").enable()
		require("lsp.dockerfile").enable()
		require("lsp.go").enable()
		--require("lsp.html").enable()
		require("lsp.lua").enable()
		require("lsp.php").enable()
		require("lsp.python").enable()
		require("lsp.rust").enable()
		require("lsp.typescript").enable()
		require("lsp.kotlin").enable()
	end,
}
