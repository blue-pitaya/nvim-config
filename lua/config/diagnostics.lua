-- FIXME: diable hints and info only for C#

vim.diagnostic.config({
	severity_sort = true,
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN },
	},
	signs = {
		severity = { min = vim.diagnostic.severity.WARN },
	},
	underline = {
		severity = { min = vim.diagnostic.severity.WARN },
	},
})
