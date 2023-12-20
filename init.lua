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
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Show tabs
-- vim.opt.list = true
-- vim.opt.listchars = "tab:⦁."

-- Custom fillchars for prettier diffview
vim.opt.fillchars:append { diff = "╱" }

-- Case insensitive search unless capital char exists
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Colorscheme and plugins
vim.cmd('colorscheme pitaya')
require('plugins')


-- Custom globals
vim.g.cmp_is_enabled = true
vim.g.diagnostics_virtual_text_enabled = true

-- Plugins rc
require('lsp_rc')
require('autocomplete_rc')
require('keybindings')
require('snippy_rc')

-- Startup
vim.cmd([[autocmd VimEnter * :clearjumps]])
