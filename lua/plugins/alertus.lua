local M = {}

function M.setup()
	vim.api.nvim_set_hl(0, "SuperColor1", { fg = "#ff0000", bg = "#ffff00", bold = true })
	vim.api.nvim_set_hl(0, "SuperColor2", { fg = "#ffff00", bg = "#ff0000", bold = true })

	local timer2 = vim.loop.new_timer()
	local counter = 1
	timer2:start(
		0,
		100,
		vim.schedule_wrap(function()
			counter = counter + 1
			if counter > 2 then
				counter = 1
			end

			local bufnr = vim.api.nvim_get_current_buf()
			local ns_id = vim.api.nvim_create_namespace("crazy")

			vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

			local hl_group = "SuperColor" .. counter

			for i, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
				for start_idx, end_idx in line:gmatch("()TODO()") do
					-- Highlight the hex color code
					vim.api.nvim_buf_add_highlight(bufnr, ns_id, hl_group, i - 1, start_idx - 1, end_idx - 1)
				end
			end
		end)
	)
end

return M
