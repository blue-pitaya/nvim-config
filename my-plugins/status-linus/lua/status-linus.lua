local M = {}

function M.setup()
	local icons = {
		error = "󰅚 ", -- x000f015a
		warn = "󰀪 ", -- x000f002a
		info = "󰋽 ", -- x000f02fd
		hint = "󰌶 ", -- x000f0336
	}

	--local statusline_options = {
	--	update_in_insert = false,
	--}

	vim.api.nvim_set_hl(0, "StatusLineFilename", { fg = "#000000", bg = "#ffff00", bold = true })

	local statusline_diagnostics = ""
	function UpdateDiagnosticsCount()
		local counts = require("lib.diagnostics").get_diagnostics()
		local components = {}

		if counts.error > 0 then
			table.insert(components, "%#DiagnosticError#")
			table.insert(components, icons.error .. " " .. counts.error)
		end
		if counts.warn > 0 then
			table.insert(components, "%#DiagnosticWarn#")
			table.insert(components, icons.warn .. " " .. counts.warn)
		end
		if counts.info > 0 then
			table.insert(components, "%#DiagnosticInfo#")
			table.insert(components, icons.info .. " " .. counts.info)
		end
		if counts.hint > 0 then
			table.insert(components, "%#DiagnosticHint#")
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
