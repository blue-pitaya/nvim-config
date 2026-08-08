-- Custom settings
vim.g.custom_autocomplete_enabled = true
vim.g.custom_visible_tabs = false

-- General
vim.opt.mouse = "a" -- enable mouse in all modes
vim.opt.termguicolors = true -- 24-bit color
vim.opt.number = true -- line numbers
vim.opt.encoding = "utf-8"
vim.opt.modeline = false -- ignore vim modelines in files

-- Case insensitive search unless capital char exists
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tabs as spaces (4-wide)
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Visible tab characters
if vim.g.custom_visible_tabs then
	vim.opt.list = true
	vim.opt.listchars = "tab:⦁."
end

-- Long line wrapping
vim.opt.wrap = true -- enable line wrapping
vim.opt.linebreak = true -- wrap at word boundaries
vim.opt.breakindent = true -- indent wrapped lines to match
vim.opt.showbreak = "↪ " -- visual marker for continuation
vim.opt.smoothscroll = true -- scroll by screen lines, not physical lines (0.10+)
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true }) -- bare j moves by display line
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true }) -- bare k moves by display line

-- Folding
vim.opt.foldmethod = "indent" -- fold by indentation level
vim.opt.foldlevel = 99 -- start with all folds open
vim.opt.foldlevelstart = 99
vim.opt.viewoptions = { "folds", "cursor" } -- only persist folds and cursor position
vim.keymap.set("n", "<leader>z", "zMzv")

-- Persist folds across buffer switches, reset on restart
vim.api.nvim_create_autocmd("BufWinLeave", { pattern = "*", command = "silent! mkview" })
vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*", command = "silent! loadview" })
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		vim.fn.delete(vim.fn.stdpath("state") .. "/view", "rf")
	end,
})

-- Startup
vim.cmd("colorscheme pitaya")
vim.api.nvim_create_autocmd("VimEnter", { -- clear jump list on startup
	pattern = "*",
	callback = function()
		vim.cmd("clearjumps")
	end,
})
vim.filetype.add({ extension = { h = "c" } }) -- .h as C, not C++

-- Module configs
require("config.autocomplete")
require("config.filetypes")
require("config.keybindings")
require("config.diagnostics")
require("config.lazy")

-- Experimental
local function load_plugin(path, opts)
	path = vim.fn.expand(path)
	if vim.fn.isdirectory(path) == 0 then
		vim.notify("Plugin not found: " .. path, vim.log.levels.WARN)
		return
	end
	vim.opt.rtp:prepend(path)
	if opts and opts.config then
		opts.config()
	end
end

-- My plugins
require("my-plugins").setup()
load_plugin("~/projects/nvim-file-tree-fuzzy-finder", {
	config = function()
		require("nvim-file-tree-fuzzy-finder").setup({})
	end,
})
