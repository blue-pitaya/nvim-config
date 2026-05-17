-- Custom settings
vim.g.custom_autocomplete_enabled = true
vim.g.custom_visible_tabs = false

--General
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.encoding = "utf-8"
vim.opt.modeline = false
vim.opt.wrap = true

-- Case insensitive search unless capital char exists
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Change tab to spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Visible tabs
if vim.g.custom_visible_tabs then
	vim.opt.list = true
	vim.opt.listchars = "tab:⦁."
end

-- Startup
vim.cmd("colorscheme pitaya")
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = "*",
	callback = function()
		vim.cmd("clearjumps")
	end,
})

require("config.autocomplete")
require("config.filetypes")
require("config.keybindings")
require("config.diagnostics")
require("config.lazy")
