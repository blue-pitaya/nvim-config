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

-- Startup
vim.cmd([[autocmd VimEnter * :clearjumps]])

-- PHP XD
vim.cmd([[au BufRead,BufNewFile *.blade.php setfiletype blade]])
vim.cmd([[au BufRead,BufNewFile *.j2 setfiletype j2]])

require("my_plugins.status-linus").setup()
require("my_plugins.alertus").setup()
require("my_plugins.hex-colorus").setup()
require("my_plugins.insert-timestamp").setup()

require("keybindings")

require("config.lazy")
