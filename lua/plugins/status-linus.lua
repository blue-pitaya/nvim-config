return {
	{
		dir = vim.fn.stdpath("config") .. "/my-plugins/status-linus",
		config = function()
			require("status-linus").setup()
		end,
	},
}
