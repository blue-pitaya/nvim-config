return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "ShadowLine", { fg = "#22282a" })
		end)

		require("ibl").setup({
			indent = {
				highlight = {
					"ShadowLine",
				},
			},
			scope = {
				enabled = false,
			},
		})
	end,
}
