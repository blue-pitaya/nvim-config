local M = {}

local function insert_timestamp()
	local timestamp = os.date("%Y-%m-%d %H:%M:%S")
	timestamp = "[" .. timestamp .. "]"
	local row, col = unpack(vim.api.nvim_win_get_cursor(0)) -- Get current cursor position
	local current_line = vim.api.nvim_get_current_line()
	local updated_line = current_line:sub(1, col) .. timestamp .. current_line:sub(col + 1)
	vim.api.nvim_set_current_line(updated_line)
    vim.api.nvim_win_set_cursor(0, {row, col + #timestamp})
end

M.setup = function()
	vim.api.nvim_create_user_command("InsertTimestamp", insert_timestamp, {})
	vim.keymap.set("i", "<C-T>", insert_timestamp)
end

return M
