return {
	"mfussenegger/nvim-dap-python",
	requires = { "rcarriga/nvim-dap-ui" }, -- just to ensure loading order
	commit = "34282820bb713b9a5fdb120ae8dd85c2b3f49b51",
	config = function()
		require("dap-python").setup("python")
	end,
}
