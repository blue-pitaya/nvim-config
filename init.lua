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

-- PLGUIN SECTION

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
load_plugin("~/projects/nvim-file-tree-fuzzy-finder", {
	config = function()
		require("nvim-file-tree-fuzzy-finder").setup({})
	end,
})

-- PLUGIN: https://github.com/stevearc/conform.nvim
load_plugin("~/packages/nvim-plugins/conform.nvim", {
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- sudo pacman -S prettier
				blade = { "blade-prettier" },
				-- sudo pacman -S clang
				c = { "clang-format" },
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
			require("conform").format({ lsp_fallback = true })
			vim.cmd("wa")
		end)
		vim.keymap.set("i", "<C-S>", function()
			require("conform").format({ lsp_fallback = true })
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
		vim.keymap.set("n", "<Leader>do", ":DiffviewOpen<CR>")
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
