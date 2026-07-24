vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" })

vim.o.autocomplete = vim.g.custom_autocomplete_enabled and true or false
-- Disable autocompletion form anywhere except when explicitly declared (LSP)
vim.o.complete = ""
vim.o.pumborder = "rounded"
-- vim.o.pummaxwidth = 40
vim.o.completeopt = "menu,menuone,noselect,popup"

-- Set winborder globally to give all floating windows a border
vim.o.winborder = "rounded"

-- Used for floating documentation block which appears when cycling through autocomplete entries
vim.api.nvim_create_autocmd("CompleteChanged", {
	callback = function()
		for _, winid in ipairs(vim.api.nvim_list_wins()) do
			local config = vim.api.nvim_win_get_config(winid)
			if config.relative ~= "" and not config.border then
				pcall(vim.api.nvim_win_set_config, winid, { border = "rounded" })
			end
		end
	end,
})

--FIXME: mixed logic of autocomplete and lsp
vim.keymap.set("i", "<C-j>", function()
	if vim.fn.pumvisible() ~= 0 then
		return vim.api.nvim_replace_termcodes("<C-n>", true, true, true)
	else
		vim.lsp.buf.code_action()
		return ""
	end
end, { expr = true, noremap = true })

--FIXME: mixed logic of autocomplete and lsp
vim.keymap.set("i", "<C-k>", function()
	if vim.fn.pumvisible() ~= 0 then
		return vim.api.nvim_replace_termcodes("<C-p>", true, true, true)
	else
		vim.lsp.buf.signature_help({ border = "rounded" })
		return ""
	end
end, { expr = true, noremap = true })

vim.keymap.set("i", "<Tab>", function()
	if vim.fn.pumvisible() ~= 0 then
		local info = vim.fn.complete_info({ "selected" })
		if info.selected == -1 then
			return "<C-n><C-y>"
		else
			return "<C-y>"
		end
	else
		return "<Tab>"
	end
end, { expr = true, noremap = true })

vim.keymap.set("i", "<CR>", function()
	if vim.fn.pumvisible() ~= 0 then
		local info = vim.fn.complete_info({ "selected" })
		if info.selected ~= -1 then
			return "<C-y>"
		else
			return "<CR>"
		end
	else
		return "<CR>"
	end
end, { expr = true, noremap = true })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			vim.notify("LSP client not found: " .. ev.data.client_id, vim.log.levels.ERROR)
			return
		end
		if client:supports_method("textDocument/completion") then
			-- trigger on every printable keypress, like nvim-cmp did
			local chars = {}
			for i = 32, 126 do
				table.insert(chars, string.char(i))
			end
			client.server_capabilities.completionProvider.triggerCharacters = chars

			vim.lsp.completion.enable(true, client.id, ev.buf, {
				autotrigger = true,
			})
		end
	end,
})
