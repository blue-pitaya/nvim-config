--General
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.encoding = "utf-8"
vim.opt.modeline = false
--vim.opt.signcolumn = "no"
vim.opt.wrap = true

-- Change tab to spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Show tabs
-- vim.opt.list = true
-- vim.opt.listchars = "tab:⦁."

-- Custom fillchars for prettier diffview
vim.opt.fillchars:append({ diff = "╱" })

-- Case insensitive search unless capital char exists
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Colorscheme and plugins
vim.cmd("colorscheme pitaya")

-- Custom globals
vim.g.cmp_is_enabled = true
vim.g.diagnostics_virtual_text_enabled = true

-- Plugins rc
require("keybindings")

-- Startup
vim.cmd([[autocmd VimEnter * :clearjumps]])

-- PHP XD
vim.cmd([[au BufRead,BufNewFile *.blade.php setfiletype blade]])
vim.cmd([[au BufRead,BufNewFile *.j2 setfiletype j2]])

-- Plugins
require("nvim-autopairs").setup({})
require("window-picker").setup({
	selection_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
	other_win_hl_color = "#00005f",
})
require("colorizer").setup()

require("lsp_rc")
require("plugins.telescope_rc")
require("plugins.treesitter_rc")
require("plugins.neo-tree_rc")
--require("plugins.lualine_rc")
require("plugins.conform_rc")
require("plugins.diffview_rc")
require("plugins.nvim-cmp_rc")
--require("plugins.leap_rc")
-- TODO: manually install shit later :)
require("mason").setup({})

-- LUALINE REWRITE

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
