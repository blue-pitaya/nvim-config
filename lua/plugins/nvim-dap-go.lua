return {
	"leoluz/nvim-dap-go",
	requires = { "rcarriga/nvim-dap-ui" }, -- just to ensure loading order
	commit = "8763ced35b19c8dc526e04a70ab07c34e11ad064",
	config = function()
		require("dap-go").setup()
	end,
}
