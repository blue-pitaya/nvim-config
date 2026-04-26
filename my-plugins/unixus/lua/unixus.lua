local M = {}

local socket_path = "/tmp/sql-nvim-html.sock"

local function send_buffer()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local content = table.concat(lines, "\n") .. "\n"
	local client = vim.uv.new_pipe()

	client:connect(socket_path, function(err)
		assert(not err, err)
		client:write(content, function(write_err)
			assert(not write_err, write_err)
			client:shutdown()
			client:close()
		end)
	end)
end

M.setup = function()
	vim.api.nvim_create_user_command("UnixusRun", function()
		send_buffer()
	end, {})
	--vim.keymap.set("n", "<leader>eu", ":UnixusRun<CR>")
end

return M
