local M = {}

function M.setup()
	local mode = "virtual_text"
	--mode = "background"

	local hex_hls = {}

	vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged" }, {
		pattern = "*",
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local ns_id = vim.api.nvim_create_namespace("hex_color_namespace")

			vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

			for i, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
				for start_idx, hex_color, end_idx in line:gmatch("()(#%x%x%x%x%x%x)()") do
					if hex_hls[hex_color] == nil then
						local hl_name = "HexColor_" .. string.sub(hex_color, 2)
						vim.api.nvim_set_hl(0, hl_name, { fg = "White", bg = hex_color, bold = true })
						hex_hls[hex_color] = hl_name
					end

					if mode == "virtual_text" then
						vim.api.nvim_buf_set_extmark(bufnr, ns_id, i - 1, 0, {
							virt_text = { { "    [", "Comment" }, { "  ", hex_hls[hex_color] }, { "]", "Comment" } },
							virt_text_pos = "eol",
						})
					else
						vim.api.nvim_buf_add_highlight(
							bufnr,
							ns_id,
							hex_hls[hex_color],
							i - 1,
							start_idx - 1,
							end_idx - 1
						)
					end
				end
			end
		end,
	})
end

return M
