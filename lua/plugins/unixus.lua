return {
	{
		dir = vim.fn.stdpath("config") .. "/my-plugins/unixus",
		config = function()
			require("unixus").setup()
		end,
	},
}
