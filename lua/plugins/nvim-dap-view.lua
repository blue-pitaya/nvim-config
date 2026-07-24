return {
	"igorlfs/nvim-dap-view",
	version = "1.*",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("dap-view").setup({
			windows = {
				position = "right",
				size = 0.5,
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "dap-view",
			callback = function()
				vim.wo.winfixwidth = false
				vim.wo.winfixheight = false
			end,
		})
	end,
}
