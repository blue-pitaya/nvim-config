return {
	{
		dir = vim.fn.expand("~/projects/nvim-useful-commands"),
		config = function()
			require("nvim-useful-commands").setup({})
		end,
	},
}
