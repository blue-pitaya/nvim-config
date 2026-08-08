local M = {}

local function setup_hex_color_preview()
	local ns = vim.api.nvim_create_namespace("hex_color_namespace")
	vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged" }, {
		pattern = "*",
		callback = function()
			local bufnr = vim.api.nvim_get_current_buf()
			vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
			for i, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
				for _, hex in line:gmatch("()(#%x%x%x%x%x%x)") do
					local hl = "HexColor_" .. hex:sub(2)
					vim.api.nvim_set_hl(0, hl, { fg = "White", bg = hex, bold = true })
					vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, 0, {
						virt_text = { { "    [", "Comment" }, { "  ", hl }, { "]", "Comment" } },
						virt_text_pos = "eol",
					})
				end
			end
		end,
	})
end

local function insert_timestamp()
	local timestamp = os.date("%Y-%m-%d %H:%M:%S")
	timestamp = "[" .. timestamp .. "]"
	local row, col = unpack(vim.api.nvim_win_get_cursor(0)) -- Get current cursor position
	local current_line = vim.api.nvim_get_current_line()
	local updated_line = current_line:sub(1, col) .. timestamp .. current_line:sub(col + 1)
	vim.api.nvim_set_current_line(updated_line)
	vim.api.nvim_win_set_cursor(0, { row, col + #timestamp })
end

function M.setup()
	setup_hex_color_preview()

	-- setup insert timestamp
	vim.api.nvim_create_user_command("InsertTimestamp", insert_timestamp, {})
	vim.keymap.set("i", "<C-T>", insert_timestamp)
end

return M
