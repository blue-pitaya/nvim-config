local M = {}

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

function M.setup()
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

return M
