-- Map file extensions to filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.axaml",
	callback = function()
		vim.bo.filetype = "xml"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.cshtml", "*.razor" },
	callback = function()
		vim.bo.filetype = "razor"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.blade.php" },
	callback = function()
		vim.bo.filetype = "blade"
	end,
})
