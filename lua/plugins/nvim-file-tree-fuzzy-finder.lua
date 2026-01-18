return {
	{
		enabled = true,
		dir = vim.fn.expand("~/projects/nvim-file-tree-fuzzy-finder"),
		config = function()
			require("nvim-file-tree-fuzzy-finder").setup({})
		end,
	},
}
