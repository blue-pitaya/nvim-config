-- Custom settingsinit
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
vim.api.nvim_create_autocmd("VimEnter", { -- clear jump list on startup
	pattern = "*",
	callback = function()
		vim.cmd("clearjumps")
	end,
})
vim.filetype.add({ extension = { h = "c" } }) -- .h as C, not C++
vim.treesitter.language.register("bash", "sh")
vim.treesitter.language.register("javascript", "javascriptreact")
vim.treesitter.language.register("tsx", "typescriptreact")
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"bash",
		"sh",
		"c",
		"cpp",
		"go",
		"java",
		"lua",
		"php",
		"python",
		"rust",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"blade",
	},
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end,
})

-- ============================================================
-- Theme
-- ============================================================

vim.opt.background = "dark"
local c = {
	c24 = "#005f87",
	c38 = "#00afd7",
	c51 = "#00ffff",
	c58 = "#5f5f00",
	c75 = "#5fafff",
	c160 = "#d70000",
	c164 = "#d700d7",
	c234 = "#1c1c1c",
	c235 = "#262626",
	c236 = "#303030",
	c237 = "#3a3a3a",
	c239 = "#4e4e4e",
	c240 = "#585858",
	c241 = "#626262",
	c243 = "#767676",
	c249 = "#b2b2b2",
	c254 = "#e4e4e4",
	white = "#e7e7e7",
	black = "#0f0f0f",
	near_black = "#151515",
	red = "#e77969",
	blue = "#7fbec9",
	froggy = "#60c9c3",
	yellow = "#c6db73",
	dead_orange = "#cf9d81",
	orange = "#f2a475",
	pink = "#ff64b5",
	subtle = "#908caa",
	subtle_darker = "#444351",
	love = "#eb6f92",
	rose = "#ea9a97",
	iris = "#c4a7e7",
	subtle_green = "#61977c",
	office_blue = "#31445c",
	dark_green = "#062d06",
	dark_red = "#440606",
	dark_blue = "#141c2e",
	bright_green = "#b8bb26",
	bright_yellow = "#fabd2f",
	deep_red = "#af0000",
	olive = "#707000",
	pale_blue = "#c0caf5",
	navy_black = "#1a1b26",
	cornflower = "#7aa2f7",
	lilac = "#bb9af7",
	slate = "#565f89",
}
vim.api.nvim_set_hl(0, "Normal", { fg = c.white, bg = c.near_black })
vim.api.nvim_set_hl(0, "Search", { bg = c.office_blue })
vim.api.nvim_set_hl(0, "CurSearch", { link = "Search" })
-- Borders
vim.api.nvim_set_hl(0, "WinSeparator", { fg = c.c239 })
vim.api.nvim_set_hl(0, "Breakpoint", { fg = c.c164 })
vim.api.nvim_set_hl(0, "Operator", { link = "Normal" })
vim.api.nvim_set_hl(0, "Number", { fg = c.blue })
vim.api.nvim_set_hl(0, "Float", { link = "Number" })
vim.api.nvim_set_hl(0, "Keyword", { fg = c.red })
vim.api.nvim_set_hl(0, "Conditional", { link = "Keyword" })
vim.api.nvim_set_hl(0, "Include", { link = "Keyword" })
vim.api.nvim_set_hl(0, "Repeat", { link = "Keyword" })
vim.api.nvim_set_hl(0, "Statement", { link = "Keyword" })
vim.api.nvim_set_hl(0, "Type", { fg = c.froggy })
vim.api.nvim_set_hl(0, "Typedef", { link = "Type" })
vim.api.nvim_set_hl(0, "Special", { link = "Type" })
vim.api.nvim_set_hl(0, "SpecialChar", { link = "Type" })
vim.api.nvim_set_hl(0, "String", { fg = c.dead_orange })
vim.api.nvim_set_hl(0, "Function", { fg = c.yellow })
vim.api.nvim_set_hl(0, "Comment", { fg = c.c241 })
vim.api.nvim_set_hl(0, "Boolean", { fg = c.rose })
vim.api.nvim_set_hl(0, "Constant", { fg = c.iris })
vim.api.nvim_set_hl(0, "Debug", { fg = c.rose })
vim.api.nvim_set_hl(0, "Define", { fg = c.iris })
vim.api.nvim_set_hl(0, "Delimiter", { fg = c.subtle })
vim.api.nvim_set_hl(0, "Exception", { fg = c.c38 })
vim.api.nvim_set_hl(0, "Label", { fg = c.blue })
vim.api.nvim_set_hl(0, "Macro", { fg = c.iris })
vim.api.nvim_set_hl(0, "PreCondit", { fg = c.iris })
vim.api.nvim_set_hl(0, "PreProc", { fg = c.c38 })
vim.api.nvim_set_hl(0, "StorageClass", { fg = c.blue })
vim.api.nvim_set_hl(0, "Structure", { fg = c.blue })
vim.api.nvim_set_hl(0, "Tag", { fg = c.subtle })
vim.api.nvim_set_hl(0, "Underlined", { underline = true })
vim.api.nvim_set_hl(0, "Todo", { link = "Comment" })
vim.api.nvim_set_hl(0, "Attribute", { fg = c.yellow })
vim.api.nvim_set_hl(0, "Property", { link = "Normal" })
-- StatusLine
vim.api.nvim_set_hl(0, "StatusLine", { fg = c.c249, bg = c.c234 })
vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })
-- General
vim.api.nvim_set_hl(0, "VisualNOS", { fg = c.c249 })
vim.api.nvim_set_hl(0, "Cursor", { reverse = true })
vim.api.nvim_set_hl(0, "Visual", { bg = c.c24 })
vim.api.nvim_set_hl(0, "WildMenu", { fg = c.c249, bg = c.c234 })
vim.api.nvim_set_hl(0, "CursorLine", { bg = c.c236 })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.c254 })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = c.c234 })
vim.api.nvim_set_hl(0, "LineNr", { fg = c.c243 })
vim.api.nvim_set_hl(0, "Directory", { fg = c.c75 })
vim.api.nvim_set_hl(0, "Identifier", { fg = c.c254 })
vim.api.nvim_set_hl(0, "TabLine", { fg = c.c254, bg = c.c234 })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = c.c254, bg = c.c24 })
vim.api.nvim_set_hl(0, "VertSplit", { fg = c.c237, bg = c.c237 })
vim.api.nvim_set_hl(0, "Error", { fg = c.c160 })
vim.api.nvim_set_hl(0, "NonText", { fg = c.c240 })
vim.api.nvim_set_hl(0, "SignColumn", {})
vim.api.nvim_set_hl(0, "SpecialKey", { fg = c.c249 })
vim.api.nvim_set_hl(0, "IncSearch", { bg = c.c58 })
vim.api.nvim_set_hl(0, "Folded", { fg = c.c239, bg = c.c234 })
vim.api.nvim_set_hl(0, "cColumn", { bg = c.c234 })
vim.api.nvim_set_hl(0, "ErrorMsg", { bg = c.c234 })
vim.api.nvim_set_hl(0, "WarningMsg", { bg = c.c234 })
vim.api.nvim_set_hl(0, "LspCodeLens", { fg = c.c241 })
vim.api.nvim_set_hl(0, "Constructor", { link = "Function" })
-- Border
vim.api.nvim_set_hl(0, "NormalFloat", {})
vim.api.nvim_set_hl(0, "FloatBorder", { fg = c.c241 })
-- Diff
vim.api.nvim_set_hl(0, "DiffChange", { bg = c.dark_blue })
vim.api.nvim_set_hl(0, "DiffText", { bg = c.dark_blue })
vim.api.nvim_set_hl(0, "DiffAdd", { bg = c.dark_green })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = c.dark_red })
vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { fg = c.dark_red, bg = c.dark_red })
vim.api.nvim_set_hl(0, "DiffviewDiffDeleteDim", { fg = c.c235 })
vim.api.nvim_set_hl(0, "FoldColumn", { fg = c.c51 })
-- Parens
vim.api.nvim_set_hl(0, "MatchParen", { bg = c.c58 })
-- Markdown
vim.api.nvim_set_hl(0, "@markup.heading.1", { fg = c.red })
vim.api.nvim_set_hl(0, "@markup.heading.2", { fg = c.orange })
vim.api.nvim_set_hl(0, "@markup.heading.3", { fg = c.yellow })
vim.api.nvim_set_hl(0, "@markup.heading.4", { fg = c.iris })
vim.api.nvim_set_hl(0, "@markup.heading.5", { fg = c.subtle })
vim.api.nvim_set_hl(0, "@markup.heading.6", { fg = c.subtle })
vim.api.nvim_set_hl(0, "@spell.markdown", { fg = c.white, bg = c.black })
vim.api.nvim_set_hl(0, "@markup.list", { fg = c.pink })
vim.api.nvim_set_hl(0, "@markup.list.checked", { fg = c.subtle_green })
vim.api.nvim_set_hl(0, "@markup.list.unchecked", { fg = c.rose })
vim.api.nvim_set_hl(0, "@markup.link", { fg = c.blue })
vim.api.nvim_set_hl(0, "@string.escape", { bg = c.subtle_darker })
vim.api.nvim_set_hl(0, "@markup.strong", {}) -- remove BOLD rule
-- HTML
vim.api.nvim_set_hl(0, "@tag.attribute", { fg = c.yellow })
-- JSON
vim.api.nvim_set_hl(0, "jsonKeyword", { link = "Keyword" })
vim.api.nvim_set_hl(0, "jsonBoolean", { link = "Boolean" })
-- Diagnostics
-- TODO: better colors for signs
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = c.deep_red })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = c.olive })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = c.deep_red, underline = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = c.olive, underline = true })
-- Misc
vim.api.nvim_set_hl(0, "htmlTagName", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@string.special.symbol", { fg = c.iris })
vim.api.nvim_set_hl(0, "@comment.documentation", { fg = c.subtle_green })
vim.api.nvim_set_hl(0, "Title", { link = "Normal" })
vim.api.nvim_set_hl(0, "SpecialComment", { link = "Special" })
vim.api.nvim_set_hl(0, "CursorColumn", { link = "CursorLine" })
-- vim highlight groups
vim.api.nvim_set_hl(0, "vimEnvvar", { link = "Constant" })
vim.api.nvim_set_hl(0, "vimHiKeyList", { link = "Constant" })
vim.api.nvim_set_hl(0, "vimCommand", { link = "Keyword" })
vim.api.nvim_set_hl(0, "vimUsrCmd", { link = "Keyword" })
vim.api.nvim_set_hl(0, "vimIsCommand", { link = "Keyword" })
vim.api.nvim_set_hl(0, "vimNotFunc", { link = "Keyword" })
vim.api.nvim_set_hl(0, "vimUserFunc", { link = "Function" })
vim.api.nvim_set_hl(0, "vimCommentTitle", { link = "Special" })
vim.api.nvim_set_hl(0, "@string.special.url.html", {}) -- disable underline for <a> in html
vim.api.nvim_set_hl(0, "@constructor.php", { link = "Function" }) -- show constructor as function
--neotree
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { link = "NeoTreeGitModified" })
--snippets
vim.api.nvim_set_hl(0, "SnippetTabstop", { bg = c.c234 })
vim.api.nvim_set_hl(0, "Changed", { fg = c.bright_yellow })
vim.api.nvim_set_hl(0, "Added", { fg = c.bright_green })
vim.api.nvim_set_hl(0, "@keyword.coroutine.typescript", { fg = c.love })
vim.api.nvim_set_hl(0, "Pmenu", { fg = c.pale_blue, bg = c.navy_black })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = c.navy_black, bg = c.cornflower })
vim.api.nvim_set_hl(0, "PmenuKind", { fg = c.lilac, bg = c.navy_black })
vim.api.nvim_set_hl(0, "PmenuKindSel", { fg = c.navy_black, bg = c.cornflower })
vim.api.nvim_set_hl(0, "PmenuExtra", { fg = c.slate, bg = c.navy_black })
vim.api.nvim_set_hl(0, "PmenuExtraSel", { fg = c.navy_black, bg = c.cornflower })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = c.navy_black })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = c.slate })

-- ============================================================
-- Keybindings
-- ============================================================

-- General
vim.keymap.set("n", "<C-S>", ":wa<CR>")
vim.keymap.set("i", "<C-S>", "<ESC>:wa<CR>")
vim.keymap.set("n", "<Space>", "<nop>")
vim.keymap.set("v", "Y", '"+y') --copy to system-wide register
vim.keymap.set("n", "<Leader>nh", ":nohlsearch<CR>")
vim.keymap.set("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')
vim.keymap.set("n", "vil", "^vg_")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("x", "<leader>p", '"_dP') -- Paste text on visual without changing register content
vim.keymap.set("n", "<Leader>q", ":tabclose<CR>")
vim.keymap.set("n", "<C-P>", ":tabnext<CR>")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Open file from quickfix window by pressing "o"
vim.cmd([[autocmd FileType qf nnoremap <buffer> o :.cc<CR>]])

-- Window bindings
vim.keymap.set("n", "<C-Q>", "<C-W>q")
vim.keymap.set("n", "<C-J>", "<C-W>j")
vim.keymap.set("n", "<C-K>", "<C-W>k")
vim.keymap.set("n", "<C-H>", "<C-W>h")
vim.keymap.set("n", "<C-L>", "<C-W>l")
vim.keymap.set("n", "+", "<C-W>+")
vim.keymap.set("n", "-", "<C-W>-")
vim.keymap.set("n", "<leader>v", ":vs<CR>")
vim.keymap.set("n", "<leader>s", ":split<CR>")
vim.keymap.set("n", "<C-space>", "<C-W>r")

-- LSP
vim.keymap.set("n", "J", function()
	vim.lsp.buf.code_action()
end)
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end)
vim.keymap.set("n", "L", function()
	vim.lsp.codelens.run()
end)
vim.keymap.set("n", "gi", function()
	vim.lsp.buf.implementation()
end)
vim.keymap.set("n", "<Leader>r", function()
	vim.lsp.buf.rename()
end)
vim.keymap.set("n", "gk", function()
	vim.lsp.buf.signature_help({ border = "rounded" })
end)

-- Neovim since some version is adding default keybindings for LSP actions that triggers timeoutlen
-- when i want to use "gr" as to show LSP references defined below
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "grt")

-- Debugging
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.close();require'dapui'.close()<CR>")
vim.keymap.set("n", "<F2><F2>", ":lua require'dapui'.toggle()<CR>")
vim.keymap.set("n", "<Leader><F2>", ":lua require'dap'.repl.toggle()<CR>")

-- ============================================================
-- Module configs
-- ============================================================

require("config.autocomplete")

-- ============================================================
-- Configuration
-- ============================================================

vim.g.enable_php_magik = false
vim.g.enable_intelephense = true

-- ============================================================
-- Diagnostics
-- ============================================================

vim.diagnostic.config({
	severity_sort = true,
	virtual_text = true,
	underline = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
		},
	},
})

-- ============================================================
-- Quickfix extensions
-- ============================================================

-- Get only unique paths by pressing <leader>u
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.keymap.set("n", "<leader>u", function()
			local seen, out = {}, {}
			for _, e in ipairs(vim.fn.getqflist()) do
				local name = vim.api.nvim_buf_get_name(e.bufnr)
				if name ~= "" and not seen[name] then
					seen[name] = true
					out[#out + 1] = e
				end
			end
			vim.fn.setqflist({}, " ", { nr = "$", items = out })
			vim.cmd("copen")
		end, { buffer = true })
	end,
})

-- ============================================================
-- Plugins
-- ============================================================

local function load_plugin(path, opts)
	path = vim.fn.expand(path)
	if vim.fn.isdirectory(path) == 0 then
		vim.notify("Plugin not found: " .. path, vim.log.levels.WARN)
		return
	end
	vim.opt.rtp:prepend(path)
	for _, f in ipairs(vim.fn.glob(path .. "/plugin/*.lua", false, true)) do
		vim.cmd.source(f)
	end
	if opts and opts.config then
		opts.config()
	end
end

-- MY PLUGIN
require("my-plugins").setup()

-- MY PLUGIN
load_plugin("~/projects/fuzzy-magik.nvim", {
	config = function()
		require("fuzzy-magik").setup({})
		vim.keymap.set("n", "<Space><Space>", function()
			require("fuzzy-magik").find_files()
		end)
		vim.keymap.set("n", "<Space>g", function()
			require("fuzzy-magik").live_grep()
		end)
		vim.keymap.set("x", "<Space>g", function()
			require("fuzzy-magik").live_grep_selection()
		end)
		vim.keymap.set("n", "<Space>r", function()
			require("fuzzy-magik").resume()
		end)
		vim.keymap.set("n", "<Space>j", function()
			require("fuzzy-magik").buffers()
		end)
		vim.keymap.set("n", "<Space>n", function()
			require("fuzzy-magik").lsp_dynamic_workspace_symbols()
		end)
		vim.keymap.set("n", "<Space>s", function()
			require("fuzzy-magik").git_status()
		end)
		vim.keymap.set("n", "<Space>d", function()
			require("fuzzy-magik").diagnostics()
		end)
		vim.keymap.set("n", "<C-n>", function()
			require("fuzzy-magik").file_browser()
		end)
		vim.keymap.set("n", "<Space>e", function()
			require("fuzzy-magik").reveal()
		end)
		vim.keymap.set("n", "gd", function()
			require("fuzzy-magik").lsp_definitions()
		end)
		vim.keymap.set("n", "gr", function()
			require("fuzzy-magik").lsp_references()
		end)
	end,
})

-- MY PLUGIN
load_plugin("~/projects/diff-magik.nvim", {
	config = function()
		require("diff-magik").setup({})
		vim.keymap.set("n", "<Leader>do", ":DiffMagikBrowser<CR>")
		vim.keymap.set("n", "<Leader>dt", ":DiffMagikBrowserDiffToggle<CR>")
	end,
})

-- PLUGIN: https://github.com/stevearc/conform.nvim
load_plugin("~/packages/nvim-plugins/conform.nvim", {
	config = function()
		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = { "*.blade.php" },
			callback = function()
				vim.bo.filetype = "blade"
			end,
		})
		require("conform").setup({
			formatters_by_ft = {
				-- sudo pacman -S prettier
				blade = { "blade-prettier" },
				-- sudo pacman -S clang
				--c = { "clang-format" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				-- sudo pacman -S stylua
				lua = { "stylua" },
				-- composer global require laravel/pint
				php = { "pint" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				-- sudo pacman -S libxml2
				xml = { "xmllint" },
			},
			formatters = {
				-- .blade.php formatter using normal html parser for simplicity
				-- `--html-whitespace-sensitivity ignore` to avoid ugly HTML tags breaking
				["blade-prettier"] = {
					command = "prettier",
					args = {
						"--parser",
						"html",
						"--html-whitespace-sensitivity",
						"ignore",
						"--stdin-filepath",
						"$FILENAME",
					},
					stdin = true,
					cwd = require("conform.util").root_file({ ".prettierrc" }),
				},
				prettier = {
					prepend_args = { "--html-whitespace-sensitivity", "ignore" },
				},
			},
		})
		vim.keymap.set("n", "<Leader>f", function()
			require("conform").format({ lsp_fallback = true })
		end)
		vim.keymap.set("n", "<C-S>", function()
			--require("conform").format({ lsp_fallback = true })
			vim.cmd("wa")
		end)
		vim.keymap.set("i", "<C-S>", function()
			--require("conform").format({ lsp_fallback = true })
			vim.cmd("stopinsert")
			vim.cmd("wa")
		end)
	end,
})

-- PLUGIN: https://github.com/sindrets/diffview.nvim
load_plugin("~/packages/nvim-plugins/diffview.nvim", {
	config = function()
		vim.opt.fillchars:append({ diff = "╱" })
		local actions = require("diffview.actions")
		require("diffview").setup({
			diff_binaries = false,
			enhanced_diff_hl = true,
			git_cmd = { "git" },
			use_icons = true,
			icons = {
				folder_closed = "",
				folder_open = "",
			},
			signs = {
				fold_closed = "",
				fold_open = "",
				done = "✓",
			},
			view = {
				default = {
					layout = "diff2_horizontal",
				},
				merge_tool = {
					layout = "diff3_horizontal",
					disable_diagnostics = true,
				},
				file_history = {
					layout = "diff2_horizontal",
				},
			},
			file_panel = {
				listing_style = "tree",
				tree_options = {
					flatten_dirs = true,
					folder_statuses = "only_folded",
				},
				win_config = {
					position = "left",
					width = 35,
					win_opts = {},
				},
			},
			file_history_panel = {
				win_config = {
					position = "bottom",
					height = 16,
					win_opts = {},
				},
			},
			commit_log_panel = {
				win_config = {
					win_opts = {},
				},
			},
			default_args = {
				DiffviewOpen = {},
				DiffviewFileHistory = {},
			},
			hooks = {},
			keymaps = {
				disable_defaults = false,
				view = {
					["<tab>"] = actions.toggle_files,
					["J"] = actions.select_next_entry,
					["<s-tab>"] = actions.select_prev_entry,
					["K"] = actions.select_prev_entry,
					["gf"] = actions.goto_file_edit,
					["<C-w><C-f>"] = actions.goto_file_split,
					["<C-w>gf"] = actions.goto_file_tab,
					["o"] = actions.goto_file_tab,
					["<Leader>e"] = actions.focus_files,
					["<Leader>b"] = actions.toggle_files,
					["g<C-x>"] = actions.cycle_layout,
					["[x"] = actions.prev_conflict,
					["]x"] = actions.next_conflict,
					["<Leader>co"] = actions.conflict_choose("ours"),
					["<Leader>ct"] = actions.conflict_choose("theirs"),
					["<Leader>cb"] = actions.conflict_choose("base"),
					["<Leader>ca"] = actions.conflict_choose("all"),
					["dx"] = actions.conflict_choose("none"),
					["L"] = actions.toggle_stage_entry,
				},
				diff1 = {},
				diff2 = {},
				diff3 = {
					{ { "n", "x" }, "2do", actions.diffget("ours") },
					{ { "n", "x" }, "3do", actions.diffget("theirs") },
				},
				diff4 = {
					{ { "n", "x" }, "1do", actions.diffget("base") },
					{ { "n", "x" }, "2do", actions.diffget("ours") },
					{ { "n", "x" }, "3do", actions.diffget("theirs") },
				},
				file_panel = {
					["<Leader>co"] = actions.conflict_choose("ours"),
					["<Leader>ct"] = actions.conflict_choose("theirs"),
					["<Leader>cb"] = actions.conflict_choose("base"),
					["<Leader>ca"] = actions.conflict_choose("all"),
					["j"] = actions.next_entry,
					["<down>"] = actions.next_entry,
					["k"] = actions.prev_entry,
					["<up>"] = actions.prev_entry,
					["<cr>"] = actions.select_entry,
					["o"] = actions.select_entry,
					["<2-LeftMouse>"] = actions.select_entry,
					["s"] = actions.toggle_stage_entry,
					["S"] = actions.stage_all,
					["U"] = actions.unstage_all,
					["X"] = actions.restore_entry,
					["R"] = actions.refresh_files,
					["L"] = actions.open_commit_log,
					["<c-b>"] = actions.scroll_view(-0.25),
					["<c-f>"] = actions.scroll_view(0.25),
					["<tab>"] = actions.select_next_entry,
					["<s-tab>"] = actions.select_prev_entry,
					["gf"] = actions.goto_file_edit,
					["<C-w><C-f>"] = actions.goto_file_split,
					["<C-w>gf"] = actions.goto_file_tab,
					["i"] = actions.listing_style,
					["f"] = actions.toggle_flatten_dirs,
					["<leader>e"] = actions.focus_files,
					["<leader>b"] = actions.toggle_files,
					["g<C-x>"] = actions.cycle_layout,
					["[x"] = actions.prev_conflict,
					["]x"] = actions.next_conflict,
				},
				file_history_panel = {
					["g!"] = actions.options,
					["<C-A-d>"] = actions.open_in_diffview,
					["y"] = actions.copy_hash,
					["L"] = actions.open_commit_log,
					["zR"] = actions.open_all_folds,
					["zM"] = actions.close_all_folds,
					["j"] = actions.next_entry,
					["<down>"] = actions.next_entry,
					["k"] = actions.prev_entry,
					["<up>"] = actions.prev_entry,
					["<cr>"] = actions.select_entry,
					["o"] = actions.select_entry,
					["<2-LeftMouse>"] = actions.select_entry,
					["<c-b>"] = actions.scroll_view(-0.25),
					["<c-f>"] = actions.scroll_view(0.25),
					["<tab>"] = actions.select_next_entry,
					["<s-tab>"] = actions.select_prev_entry,
					["gf"] = actions.goto_file_edit,
					["<C-w><C-f>"] = actions.goto_file_split,
					["<C-w>gf"] = actions.goto_file_tab,
					["<leader>e"] = actions.focus_files,
					["<leader>b"] = actions.toggle_files,
					["g<C-x>"] = actions.cycle_layout,
				},
				option_panel = {
					["<tab>"] = actions.select_entry,
					["q"] = actions.close,
				},
			},
		})
		vim.keymap.set("n", "<Leader>dh", ":DiffviewFileHistory %<CR>")
	end,
})

-- PLUGIN: https://github.com/lukas-reineke/indent-blankline.nvim
load_plugin("~/packages/nvim-plugins/indent-blankline.nvim", {
	config = function()
		-- Set color for tab shadowline
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "ShadowLine", { fg = "#22282a" })
		end)
		require("ibl").setup({
			indent = {
				highlight = { "ShadowLine" },
			},
			scope = {
				-- Disable scope highlighting
				enabled = false,
			},
		})
	end,
})

-- ============================================================
-- LSP
-- ============================================================

-- Bash
-- require: sudo pacman -S bash-language-server
vim.lsp.config("bashls", {
	cmd = { "bash-language-server", "start" },
	settings = {
		bashIde = {
			globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
		},
	},
	filetypes = { "bash", "sh" },
	root_markers = { ".git" },
})
vim.lsp.enable("bashls")

-- C/C++
-- sudo pacman -S clang
vim.lsp.config("clangd", {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
	root_markers = {
		".clangd",
		".clang-format",
		"compile_commands.json",
		".git",
	},
	on_attach = function(client, _)
		-- disable syntax highlight from tsserver (treesitter is preffered)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})
vim.lsp.enable("clangd")

-- Go
-- sudo pacman -S gopls delve
vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.work", "go.mod", ".git" },
})
vim.lsp.enable("gopls")

-- Java
-- git clone https://github.com/AlexandrosAlexiou/intellij-server.nvim.git
load_plugin("~/packages/nvim-plugins/intellij-server.nvim", {
	config = function()
		-- Fringe fix for rename problems
		local util = vim.lsp.util
		local apply = util.apply_text_document_edit
		util.apply_text_document_edit = function(edit, ...)
			edit.textDocument.version = 0
			return apply(edit, ...)
		end

		require("intellij-server").setup({
			javaHome = "/usr/lib/jvm/default",
			on_attach = function(client, _)
				client.server_capabilities.semanticTokensProvider = nil
			end,
			settings = {
				["jetbrains.java.hints.types.local variable"] = false,
				["jetbrains.java.hints.types.call chain"] = false,
				["jetbrains.java.hints.settings.method parameter"] = false,
			},
		})
	end,
})

-- Lua
-- sudo pacman -S lua-language-server
vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	on_attach = function(client, _)
		client.server_capabilities.semanticTokensProvider = nil
	end,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				library = { vim.env.VIMRUNTIME },
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})
vim.lsp.enable("lua_ls")

-- PHP
-- pacman -S bubblewrap
-- npm i intelephense -g
-- Config ref: https://github.com/yaegassy/coc-intelephense
vim.lsp.config("intelephense", {
	cmd = {
		"bwrap",
		-- system binaries, libs, node runtime
		"--ro-bind",
		"/usr",
		"/usr",
		-- dns, certs, timezone
		"--ro-bind",
		"/etc",
		"/etc",
		-- empty writable home (hides real home)
		"--tmpfs",
		vim.fn.expand("~"),
		-- intelephense binary (symlink target)
		"--ro-bind",
		vim.fn.expand("~/.local/bin"),
		vim.fn.expand("~/.local/bin"),
		-- intelephense js source
		"--ro-bind",
		vim.fn.expand("~/.local/lib"),
		vim.fn.expand("~/.local/lib"),
		-- arch merged-usr symlinks
		"--symlink",
		"usr/lib",
		"/lib",
		"--symlink",
		"usr/lib",
		"/lib64",
		"--symlink",
		"usr/bin",
		"/bin",
		-- node needs /proc/self
		"--proc",
		"/proc",
		-- /dev/null, /dev/urandom
		"--dev",
		"/dev",
		-- writable scratch space
		"--tmpfs",
		"/tmp",
		-- project files (read-only)
		"--ro-bind",
		vim.fn.getcwd(),
		vim.fn.getcwd(),
		-- no network for process and children
		"--unshare-net",
		-- kill when neovim exits
		"--die-with-parent",
		"--",
		vim.fn.expand("~/.local/bin/intelephense"),
		"--stdio",
	},
	-- without filetypes/root_dir the server runs in single-file mode: no workspace index, no types
	filetypes = { "php" },
	-- mirrors lspconfig: prefer cwd when it sits inside the project root,
	-- since cwd is the only project path bound into the sandbox
	root_dir = function(bufnr, on_dir)
		local cwd = vim.fn.getcwd()
		local root = vim.fs.root(bufnr, { "composer.json", ".git" })
		if root and vim.startswith(cwd, root) then
			on_dir(cwd)
		else
			on_dir(root or cwd)
		end
	end,
	-- index/stub cache; defaults are os.tmpdir() / os.homedir(), home is a tmpfs here
	init_options = {
		storagePath = "/tmp/intelephense",
		globalStoragePath = "/tmp/intelephense-global",
	},
	settings = {
		intelephense = {
			files = {
				exclude = {
					"**/.git/**",
					"**/.svn/**",
					"**/.hg/**",
					"**/CVS/**",
					"**/.DS_Store/**",
					"**/node_modules/**",
					"**/bower_components/**",
					"**/vendor/**/{Tests,tests}/**",
					"**/.history/**",
					"**/vendor/**/vendor/**",
					"**/*.blade.php",
				},
			},
			diagnostics = { enable = true },
			telemetry = { enabled = false },
			completion = {
				parameterCase = "camel",
				propertyCase = "camel",
			},
		},
	},
})
if vim.g.enable_intelephense then
	vim.lsp.enable("intelephense")
end
if vim.g.enable_php_magik then
	require("my-plugins").init_php_magik()
end

-- Python
-- pipx install basedpyright
-- sudo pacman -S ruff
vim.lsp.config("basedpyright", {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	settings = {
		basedpyright = {
			disableOrganizeImports = true,
			analysis = {
				typeCheckingMode = "basic",
				useLibraryCodeForTypes = true,
				autoImportCompletions = true,
				autoSearchPaths = true,
			},
		},
	},
})
vim.lsp.enable("basedpyright")
vim.lsp.config("ruff", {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
})
vim.lsp.enable("ruff")

-- Rust
-- sudo pacman -S rust-analyzer
vim.lsp.config("rust_analyzer", {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", "rust-project.json", ".git" },
	on_attach = function(client, bufnr)
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		if client:supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
vim.lsp.enable("rust_analyzer")

-- Typescript
-- sudo pacman -S typescript typescript-language-server
vim.lsp.config("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = {
		{ "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
		".git",
	},
	init_options = { hostInfo = "neovim" },
	on_init = function(client, _)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})
vim.lsp.enable("ts_ls")
