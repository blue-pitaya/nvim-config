local M = {}

--nvim_workspace_diagnostic = function()
--	local diag_severity = vim.diagnostic.severity

--	local function workspace_diag(severity)
--		local count = vim.diagnostic.get(nil, { severity = severity })
--		return vim.tbl_count(count)
--	end

--	return workspace_diag(diag_severity.ERROR),
--		workspace_diag(diag_severity.WARN),
--		workspace_diag(diag_severity.INFO),
--		workspace_diag(diag_severity.HINT)
--end,

---returns list of diagnostics count from all sources
---@return table {error, warn, info, hint}
M.get_diagnostics = function()
	--local bufnr = vim.api.nvim_get_current_buf()
	--
	local diagnostics = vim.diagnostic.get(0)
	local count = { 0, 0, 0, 0 }

	for _, diagnostic in ipairs(diagnostics) do
		count[diagnostic.severity] = count[diagnostic.severity] + 1
		--if vim.startswith(vim.diagnostic.get_namespace(diagnostic.namespace).name, "vim.lsp") then
		--	count[diagnostic.severity] = count[diagnostic.severity] + 1
		--end
	end

	return {
		error = count[vim.diagnostic.severity.ERROR],
		warn = count[vim.diagnostic.severity.WARN],
		info = count[vim.diagnostic.severity.INFO],
		hint = count[vim.diagnostic.severity.HINT],
	}
end

return M
