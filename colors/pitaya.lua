vim.opt.background = "dark"

local sc = {
	c17 = "#00005f",
	c24 = "#005f87",
	c38 = "#00afd7",
	c44 = "#00d7d7",
	c51 = "#00ffff",
	c58 = "#5f5f00",
	c75 = "#5fafff",
	c160 = "#d70000",
	c164 = "#d700d7",
	c186 = "#d7d787",
	c234 = "#1c1c1c",
	c235 = "#262626",
	c236 = "#303030",
	c237 = "#3a3a3a",
	c238 = "#444444",
	c239 = "#4e4e4e",
	c240 = "#585858",
	c241 = "#626262",
	c242 = "#6c6c6c",
	c243 = "#767676",
	c249 = "#b2b2b2",
	c254 = "#e4e4e4",
}

local c = {
	white = "#e7e7e7",
	black = "#0f0f0f",
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
}

vim.api.nvim_set_hl(0, "Normal", { fg = c.white, bg = "#151515" })

vim.api.nvim_set_hl(0, "Search", { bg = c.office_blue })
vim.api.nvim_set_hl(0, "CurSearch", { link = "Search" })

-- Borders
vim.api.nvim_set_hl(0, "VertSplit", { fg = sc.c239 })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = sc.c239 })

vim.api.nvim_set_hl(0, "Breakpoint", { fg = sc.c164 })

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
vim.api.nvim_set_hl(0, "SpecialComment", { link = "Type" })

vim.api.nvim_set_hl(0, "String", { fg = c.dead_orange })

vim.api.nvim_set_hl(0, "Function", { fg = c.yellow })

vim.api.nvim_set_hl(0, "Comment", { fg = sc.c241 })

vim.api.nvim_set_hl(0, "Boolean", { fg = c.rose })
vim.api.nvim_set_hl(0, "Constant", { fg = c.iris })
vim.api.nvim_set_hl(0, "Debug", { fg = c.rose })
vim.api.nvim_set_hl(0, "Define", { fg = c.iris })
vim.api.nvim_set_hl(0, "Delimiter", { fg = c.subtle })
vim.api.nvim_set_hl(0, "Error", { fg = c.love })
vim.api.nvim_set_hl(0, "Exception", { fg = sc.c38 })
vim.api.nvim_set_hl(0, "Identifier", { fg = c.rose })
vim.api.nvim_set_hl(0, "Label", { fg = c.blue })
vim.api.nvim_set_hl(0, "Macro", { fg = c.iris })
vim.api.nvim_set_hl(0, "PreCondit", { fg = c.iris })
vim.api.nvim_set_hl(0, "PreProc", { fg = sc.c38 })

vim.api.nvim_set_hl(0, "StorageClass", { fg = c.blue })
vim.api.nvim_set_hl(0, "Structure", { fg = c.blue })
vim.api.nvim_set_hl(0, "Tag", { fg = c.subtle })
vim.api.nvim_set_hl(0, "Underlined", { underline = true })
vim.api.nvim_set_hl(0, "Todo", { link = "Comment" })
vim.api.nvim_set_hl(0, "Attribute", { fg = c.yellow })
vim.api.nvim_set_hl(0, "Property", { link = "Normal" })

-- StatusLine
vim.api.nvim_set_hl(0, "StatusLine", { fg = sc.c249, bg = sc.c234 })
vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })

-- General
vim.api.nvim_set_hl(0, "VisualNOS", { fg = sc.c249 })
vim.api.nvim_set_hl(0, "PmenuSbar", { fg = sc.c238 })
vim.api.nvim_set_hl(0, "Cursor", { reverse = true })
vim.api.nvim_set_hl(0, "Visual", { bg = sc.c24 })
vim.api.nvim_set_hl(0, "WildMenu", { fg = sc.c249, bg = sc.c234 })
vim.api.nvim_set_hl(0, "CursorLine", { bg = sc.c236 })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = sc.c254 })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = sc.c234 })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = sc.c249, bg = sc.c24 })
vim.api.nvim_set_hl(0, "LineNr", { fg = sc.c243 })
vim.api.nvim_set_hl(0, "Directory", { fg = sc.c75 })
vim.api.nvim_set_hl(0, "Identifier", { fg = sc.c254 })
vim.api.nvim_set_hl(0, "TabLine", { fg = sc.c254, bg = sc.c234 })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = sc.c24 })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = sc.c254, bg = sc.c24 })
vim.api.nvim_set_hl(0, "VertSplit", { fg = sc.c237, bg = sc.c237 })
vim.api.nvim_set_hl(0, "Error", { fg = sc.c160 })
vim.api.nvim_set_hl(0, "Pmenu", { fg = sc.c249, bg = sc.c234 })
vim.api.nvim_set_hl(0, "NonText", { fg = sc.c240 })
vim.api.nvim_set_hl(0, "SignColumn", {})
vim.api.nvim_set_hl(0, "SpecialKey", { fg = sc.c249 })
vim.api.nvim_set_hl(0, "IncSearch", { bg = sc.c58 })
vim.api.nvim_set_hl(0, "Folded", { fg = sc.c239, bg = sc.c234 })
vim.api.nvim_set_hl(0, "cColumn", { bg = sc.c234 })
vim.api.nvim_set_hl(0, "ErrorMsg", { bg = sc.c234 })
vim.api.nvim_set_hl(0, "WarningMsg", { bg = sc.c234 })
vim.api.nvim_set_hl(0, "LspCodeLens", { fg = sc.c241 })
vim.api.nvim_set_hl(0, "Constructor", { link = "Function" })

-- Border
vim.api.nvim_set_hl(0, "NormalFloat", {})
vim.api.nvim_set_hl(0, "FloatBorder", { fg = sc.c241 })

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = sc.c242 })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = sc.c237 })

-- Diff
vim.api.nvim_set_hl(0, "DiffChange", { bg = c.dark_blue })
vim.api.nvim_set_hl(0, "DiffText", { bg = c.dark_blue })
vim.api.nvim_set_hl(0, "DiffAdd", { bg = c.dark_green })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = c.dark_red })
vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { fg = c.dark_red, bg = c.dark_red })
vim.api.nvim_set_hl(0, "DiffviewDiffDeleteDim", { fg = sc.c235 })
vim.api.nvim_set_hl(0, "FoldColumn", { fg = sc.c51 })

-- Parens
vim.api.nvim_set_hl(0, "MatchParen", { bg = sc.c58 })

-- NvimTree
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = sc.c186 })
vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = sc.c44 })
vim.api.nvim_set_hl(0, "NvimTreeWindowPicker", { fg = sc.c254, bg = sc.c17, bold = true })

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
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#af0000" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#707000" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = "#af0000", underline = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = "#707000", underline = true })

-- Misc
vim.api.nvim_set_hl(0, "NvimTreeGitNew", { link = "NvimTreeGitDirty" })
vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { link = "NvimTreeGitDirty" })
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

-- nvim-cmp
vim.api.nvim_set_hl(0, "CmpItemKind", { link = "Type" })
vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "NonText" })
vim.api.nvim_set_hl(0, "CmpItemAbbr", { link = "Identifier" })
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { link = "Error" })

vim.api.nvim_set_hl(0, "@string.special.url.html", {}) -- disable underline for <a> in html
vim.api.nvim_set_hl(0, "@constructor.php", { link = "Function" }) -- show constructor as function

--neotree
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { link = "NeoTreeGitModified" })

--snippets
vim.api.nvim_set_hl(0, "SnippetTabstop", { bg = sc.c234 })

vim.api.nvim_set_hl(0, "Changed", { fg = c.bright_yellow })
vim.api.nvim_set_hl(0, "Added", { fg = c.bright_green })

vim.api.nvim_set_hl(0, "@keyword.coroutine.typescript", { fg = c.love })

vim.api.nvim_set_hl(0, "Pmenu", { fg = "#c0caf5", bg = "#1a1b26" })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#1a1b26", bg = "#7aa2f7" })
vim.api.nvim_set_hl(0, "PmenuKind", { fg = "#bb9af7", bg = "#1a1b26" })
vim.api.nvim_set_hl(0, "PmenuKindSel", { fg = "#1a1b26", bg = "#7aa2f7" })
vim.api.nvim_set_hl(0, "PmenuExtra", { fg = "#565f89", bg = "#1a1b26" })
vim.api.nvim_set_hl(0, "PmenuExtraSel", { fg = "#1a1b26", bg = "#7aa2f7" })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1a1b26" })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#565f89" })
