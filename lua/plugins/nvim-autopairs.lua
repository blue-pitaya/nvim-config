return {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup()

		--FIXME: mixed logic of autocomplete <CR> and nvim-autopairs mapping
		vim.keymap.set("i", "<CR>", function()
			if vim.fn.pumvisible() ~= 0 then
				local info = vim.fn.complete_info({ "selected" })
				if info.selected == -1 then
					return vim.api.nvim_replace_termcodes("<C-n><C-y>", true, true, true)
				else
					return vim.api.nvim_replace_termcodes("<C-y>", true, true, true)
				end
			else
				return require("nvim-autopairs").autopairs_cr()
			end
		end, { expr = true, noremap = true })
	end,
}
