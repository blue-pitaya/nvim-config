return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			enabled = vim.g.custom_autocomplete_enabled,
			window = {
				completion = {
					border = "rounded",
					scrollbar = "",
				},
				documentation = {
					border = "rounded",
					scrollbar = "",
				},
				entries_win = {
					wrap = true,
				},
			},
			mapping = {
				["<tab>"] = cmp.mapping.select_next_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-h>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-l>"] = cmp.mapping.confirm({ select = true }),
			},
			sources = {
				{ name = "nvim_lsp" },
			},
			experimental = {
				ghost_text = true,
			},
		})
	end,
}
