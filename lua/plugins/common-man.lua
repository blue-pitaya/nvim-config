return {
	{
		dir = vim.fn.stdpath("config") .. "/my-plugins/common-man",
		config = function()
			require("insert-timestamp").setup()
		end,
	},
}
