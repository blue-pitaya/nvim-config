return {
	"rcarriga/nvim-dap-ui",
	requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	commit = "f7d75cca202b52a60c520ec7b1ec3414d6e77b0f", --v4.0.0
	config = function()
		require("dapui").setup()
	end,
}
