vim.diagnostic.config({
	severity_sort = true,
	virtual_text = {
		severity = { min = vim.diagnostic.severity.HINT },
	},
	signs = {
		severity = { min = vim.diagnostic.severity.HINT },
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
		},
	},
	underline = {
		severity = { min = vim.diagnostic.severity.HINT },
	},
})

-- Only color line number if diagnostic occurered on given line
local signs = { "Error", "Warn", "Hint", "Info" }
for _, sign in pairs(signs) do
	local hl = "DiagnosticSign" .. sign
	vim.fn.sign_define(hl, { text = "", texthl = hl, numhl = hl })
end
