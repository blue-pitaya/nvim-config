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

-- Custom globals
vim.g.cmp_is_enabled = true
vim.g.diagnostics_virtual_text_enabled = true

-- Plugins rc
-- require('autocomplete_rc')
require('keybindings')
-- require('snippy_rc')

-- Startup
vim.cmd([[autocmd VimEnter * :clearjumps]])

-- PHP XD
vim.cmd([[au BufRead,BufNewFile *.blade.php setfiletype blade]]);

-- Plugins
require('nvim-autopairs').setup({})
require('window-picker').setup({
  selection_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  other_win_hl_color = '#00005f',
})
require('colorizer').setup()

require('lsp_rc')
require('plugins.telescope_rc')
require('plugins.treesitter_rc')
require('plugins.neo-tree_rc')
require('plugins.lualine_rc')
require('plugins.conform_rc')
require('plugins.diffview_rc')
--require("plugins.leap_rc")
--require("mason").setup({})
