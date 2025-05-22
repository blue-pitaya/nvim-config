return {
	{
		dir = vim.fn.stdpath("config") .. "/my-plugins/hex-colorus",
		config = function()
			require("hex-colorus").setup()
		end,
	},
}
