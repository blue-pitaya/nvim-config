return {
	{
		enabled = false,
		dir = vim.fn.expand("~/projects/nvim-cmd-buf-output"),
		config = function()
			require("nvim-cmd-buf-output").setup({
				cmd = { "ls", "-lah" },
			})
		end,
	},
}
