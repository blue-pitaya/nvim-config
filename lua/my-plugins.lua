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

local polish_map = {
	["ą"] = "a",
	["Ą"] = "A",
	["ć"] = "c",
	["Ć"] = "C",
	["ę"] = "e",
	["Ę"] = "E",
	["ł"] = "l",
	["Ł"] = "L",
	["ń"] = "n",
	["Ń"] = "N",
	["ó"] = "o",
	["Ó"] = "O",
	["ś"] = "s",
	["Ś"] = "S",
	["ź"] = "z",
	["Ź"] = "Z",
	["ż"] = "z",
	["Ż"] = "Z",
}

local function remove_polish_chars(text)
	local result = text
	for polish, replacement in pairs(polish_map) do
		result = result:gsub(polish, replacement)
	end
	return result
end

local function to_camel_case(text)
	-- Remove Polish characters first
	text = remove_polish_chars(text)

	-- Split by spaces and non-alphanumeric characters
	local words = {}
	for word in text:gmatch("[%w]+") do
		table.insert(words, word:lower())
	end

	-- Build camelCase string
	if #words == 0 then
		return ""
	end

	local result = words[1]
	for i = 2, #words do
		result = result .. words[i]:sub(1, 1):upper() .. words[i]:sub(2)
	end

	return result
end

-- Main function to convert selected text
local function convert_selection()
	-- Get visual selection range
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local start_line = start_pos[2]
	local end_line = end_pos[2]
	local start_col = start_pos[3]
	local end_col = end_pos[3]

	-- Get selected text
	local lines = vim.fn.getline(start_line, end_line)

	if type(lines) == "string" then
		lines = { lines }
	end

	-- Handle single line selection
	if #lines == 1 then
		local text = lines[1]:sub(start_col, end_col)
		local converted = to_camel_case(text)

		-- Replace the selection
		local new_line = lines[1]:sub(1, start_col - 1) .. converted .. lines[1]:sub(end_col + 1)
		vim.fn.setline(start_line, new_line)
	else
		-- Handle multi-line selection
		local text = ""
		for i, line in ipairs(lines) do
			if i == 1 then
				text = text .. line:sub(start_col)
			elseif i == #lines then
				text = text .. " " .. line:sub(1, end_col)
			else
				text = text .. " " .. line
			end
		end

		local converted = to_camel_case(text)

		-- Replace with converted text on first line, delete other lines
		vim.fn.setline(start_line, converted)
		if end_line > start_line then
			vim.cmd(string.format("%d,%dd", start_line + 1, end_line))
		end
	end
end

local function get_diagnostics()
	local diagnostics = vim.diagnostic.get(0)
	local count = { 0, 0, 0, 0 }

	for _, diagnostic in ipairs(diagnostics) do
		count[diagnostic.severity] = count[diagnostic.severity] + 1
	end

	return {
		error = count[vim.diagnostic.severity.ERROR],
		warn = count[vim.diagnostic.severity.WARN],
		info = count[vim.diagnostic.severity.INFO],
		hint = count[vim.diagnostic.severity.HINT],
	}
end

local function setup_status_linus()
	local icons = {
		error = "󰅚 ", -- x000f015a
		warn = "󰀪 ", -- x000f002a
		info = "󰋽 ", -- x000f02fd
		hint = "󰌶 ", -- x000f0336
	}

	vim.api.nvim_set_hl(0, "StatusLineFilename", { fg = "#000000", bg = "#ffff00", bold = true })

	local statusline_diagnostics = ""
	function UpdateDiagnosticsCount()
		local counts = get_diagnostics()
		local components = {}

		if counts.error > 0 then
			table.insert(components, "%#DiagnosticSignError#")
			table.insert(components, icons.error .. " " .. counts.error)
		end
		if counts.warn > 0 then
			table.insert(components, "%#DiagnosticSignWarn#")
			table.insert(components, icons.warn .. " " .. counts.warn)
		end
		if counts.info > 0 then
			table.insert(components, "%#DiagnosticSignInfo#")
			table.insert(components, icons.info .. " " .. counts.info)
		end
		if counts.hint > 0 then
			table.insert(components, "%#DiagnosticSignHint#")
			table.insert(components, icons.hint .. " " .. counts.hint)
		end
		table.insert(components, "%#StatusLine#")

		statusline_diagnostics = table.concat(components, " ")
	end

	local timer = vim.loop.new_timer()
	if timer ~= nil then
		timer:start(
			0,
			250,
			vim.schedule_wrap(function()
				UpdateDiagnosticsCount()
				vim.opt.statusline = "%#StatusLine#%f "
					.. "%m " -- modified flag
					.. "%r " -- readonly flag
					.. statusline_diagnostics
					.. "%=" -- align rest to end
					.. "%l:%c" -- line:column
			end)
		)
	end
end

function M.setup()
	setup_hex_color_preview()

	-- setup insert timestamp
	vim.api.nvim_create_user_command("InsertTimestamp", insert_timestamp, {})
	vim.keymap.set("i", "<C-T>", insert_timestamp)

	-- setup "ToCamelCase" command
	vim.api.nvim_create_user_command("ToCamelCase", convert_selection, { range = true })

	setup_status_linus()
end

return M
