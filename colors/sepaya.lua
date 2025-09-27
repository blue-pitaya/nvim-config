vim.opt.background = "light"


local sc = {
	c17 = "#00005f",
	c24 = "#005f87",
	c38 = "#00afd7",
	c44 = "#00d7d7",
	c51 = "#00ffff",
	c58 = "#5f5f00",
	c75 = "#5fafff",
	c151 = "#afd7af",
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

local p = {
	dark0_hard = "#1d2021",
	dark0 = "#282828",
	dark0_soft = "#32302f",
	dark1 = "#3c3836",
	dark2 = "#504945",
	dark3 = "#665c54",
	dark4 = "#7c6f64",
	light0_hard = "#f9f5d7",
	light0 = "#fbf1c7",
	light0_soft = "#f2e5bc",
	light1 = "#ebdbb2",
	light2 = "#d5c4a1",
	light3 = "#bdae93",
	light4 = "#a89984",
	bright_red = "#fb4934",
	bright_green = "#b8bb26",
	bright_yellow = "#fabd2f",
	bright_blue = "#83a598",
	bright_purple = "#d3869b",
	bright_aqua = "#8ec07c",
	bright_orange = "#fe8019",
	neutral_red = "#cc241d",
	neutral_green = "#98971a",
	neutral_yellow = "#d79921",
	neutral_blue = "#458588",
	neutral_purple = "#b16286",
	neutral_aqua = "#689d6a",
	neutral_orange = "#d65d0e",
	faded_red = "#9d0006",
	faded_green = "#79740e",
	faded_yellow = "#b57614",
	faded_blue = "#076678",
	faded_purple = "#8f3f71",
	faded_aqua = "#427b58",
	faded_orange = "#af3a03",
	dark_red_hard = "#792329",
	dark_red = "#722529",
	dark_red_soft = "#7b2c2f",
	light_red_hard = "#fc9690",
	light_red = "#fc9487",
	light_red_soft = "#f78b7f",
	dark_green_hard = "#5a633a",
	dark_green = "#62693e",
	dark_green_soft = "#686d43",
	light_green_hard = "#d3d6a5",
	light_green = "#d5d39b",
	light_green_soft = "#cecb94",
	dark_aqua_hard = "#3e4934",
	dark_aqua = "#49503b",
	dark_aqua_soft = "#525742",
	light_aqua_hard = "#e6e9c1",
	light_aqua = "#e8e5b5",
	light_aqua_soft = "#e1dbac",
	gray = "#928374",
}

local c = {
	white = "#e7e7e7",
	pure_black = "#000000",
	black = "#0f0f0f",

	red = p.neutral_red, -- "#e77969",
	blue = p.faded_blue, -- "#7fbec9",
	froggy = p.faded_blue, -- "#60c9c3",
	yellow = p.faded_yellow, -- "#c6db73",
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
}

local li = {
	bg0 = p.light0,
	bg1 = p.light1,
	bg2 = p.light2,
	bg3 = p.light3,
	bg4 = p.light4,
	fg0 = p.dark0,
	fg1 = p.dark1,
	fg2 = p.dark2,
	fg3 = p.dark3,
	fg4 = p.dark4,
	red = p.faded_red,
	green = p.faded_green,
	yellow = p.faded_yellow,
	blue = p.faded_blue,
	purple = p.faded_purple,
	aqua = p.faded_aqua,
	orange = p.faded_orange,
	neutral_red = p.neutral_red,
	neutral_green = p.neutral_green,
	neutral_yellow = p.neutral_yellow,
	neutral_blue = p.neutral_blue,
	neutral_purple = p.neutral_purple,
	neutral_aqua = p.neutral_aqua,
	dark_red = p.light_red,
	dark_green = p.light_green,
	dark_aqua = p.light_aqua,
	gray = p.gray,
}

local definitions = {
	{ "Normal", { fg = li.fg1, bg = li.bg1 } },

	{ "Search", { bg = c.office_blue } },
	{ "CurSearch", { link = "Search" } },

	-- Borders
	{ "VertSplit", { fg = sc.c239 } },
	{ "WinSeparator", { fg = sc.c239 } },

	{ "Breakpoint", { fg = sc.c164 } },

	{ "Operator", { link = "Normal" } },

	{ "Number", { fg = c.blue } },
	{ "Float", { link = "Number" } },

	{ "Keyword", { fg = c.red } },
	{ "Conditional", { link = "Keyword" } },
	{ "Include", { link = "Keyword" } },
	{ "Repeat", { link = "Keyword" } },
	{ "Statement", { link = "Keyword" } },

	{ "Type", { fg = c.froggy } },
	{ "Typedef", { link = "Type" } },
	{ "Special", { link = "Type" } },
	{ "SpecialChar", { link = "Type" } },
	{ "SpecialComment", { link = "Type" } },

	{ "String", { fg = p.faded_green } },

	{ "Function", { fg = c.yellow } },

	{ "Comment", { fg = sc.c241 } },

	{ "Boolean", { fg = c.rose } },
	{ "Constant", { fg = c.iris } },
	{ "Debug", { fg = c.rose } },
	{ "Define", { fg = c.iris } },
	{ "Delimiter", { fg = p.faded_purple } },
	{ "Error", { fg = c.love } },
	{ "Exception", { fg = sc.c38 } },
	--{ 'Float', {fg = c151, }},
	{ "Label", { fg = c.blue } },
	{ "Macro", { fg = c.iris } },
	{ "PreCondit", { fg = c.iris } },
	{ "PreProc", { fg = sc.c38 } },

	{ "StorageClass", { fg = c.blue } },
	{ "Structure", { fg = c.blue } },
	{ "Tag", { fg = c.subtle } },
	{ "Underlined", { underline = true } },
	{ "Todo", { link = "Comment" } },
	{ "Attribute", { fg = c.yellow } },
	{ "Property", { link = "Normal" } },

	-- StatusLine
	{ "StatusLine", { fg = sc.c249, bg = sc.c234 } },
	{ "StatusLineNC", { link = "Normal" } },

	-- General
	{ "VisualNOS", { fg = sc.c249 } },
	{ "PmenuSbar", { fg = sc.c238 } },
	--{ "Cursor", { bg = c.pure_black } },
	{ "Visual", { bg = sc.c24 } },
	{ "WildMenu", { fg = sc.c249, bg = sc.c234 } },
	{ "CursorLine", { bg = sc.c236 } },
	{ "CursorLineNr", { fg = sc.c254 } },
	{ "TabLineFill", { bg = sc.c234 } },
	{ "PmenuSel", { fg = sc.c249, bg = sc.c24 } },
	{ "LineNr", { fg = sc.c243 } },
	{ "Directory", { fg = sc.c75 } },
	{ "Identifier", { fg = li.blue } },
	{ "TabLine", { fg = sc.c254, bg = sc.c234 } },
	{ "PmenuThumb", { bg = sc.c24 } },
	{ "TabLineSel", { fg = sc.c254, bg = sc.c24 } },
	{ "VertSplit", { fg = sc.c237, bg = sc.c237 } },
	{ "Error", { fg = sc.c160 } },
	{ "Pmenu", { fg = sc.c249, bg = sc.c234 } },
	{ "NonText", { fg = sc.c240 } },
	{ "SignColumn", {} },
	{ "SpecialKey", { fg = sc.c249 } },
	{ "IncSearch", { bg = sc.c58 } },
	{ "Folded", { fg = sc.c239, bg = sc.c234 } },
	{ "cColumn", { bg = sc.c234 } },
	{ "ErrorMsg", { bg = sc.c234 } },
	{ "WarningMsg", { bg = sc.c234 } },
	{ "LspCodeLens", { fg = sc.c241 } },
	{ "Constructor", { link = "Function" } },

	-- Border
	{ "NormalFloat", {} },
	{ "FloatBorder", { fg = sc.c241 } },

	-- Telescope
	{ "TelescopeBorder", { fg = sc.c242 } },
	{ "TelescopeSelection", { bg = sc.c237 } },

	-- Diff
	{ "DiffChange", { bg = c.dark_blue } },
	{ "DiffText", { bg = c.dark_blue } },
	{ "DiffAdd", { bg = c.dark_green } },
	{ "DiffDelete", { bg = c.dark_red } },
	{ "DiffviewDiffDelete", { fg = c.dark_red, bg = c.dark_red } },
	{ "DiffviewDiffDeleteDim", { fg = sc.c235 } },
	{ "FoldColumn", { fg = sc.c51 } },

	-- Parens
	{ "MatchParen", { bg = sc.c58 } },

	-- Scala
	-- { 'scalaKeywordModifier', { link = 'Keyword' }},
	-- { 'scalaOperator', { link = 'Operator' }},
	-- { 'scalaCapitalWord', { fg = p.blue }},
	-- { 'scalaCaseFollowing', { link = "Normal" }},
	-- { 'scalaAkkaSpecialWord', { link = "Normal" }},
	-- { 'scalatestSpecialWord', { link = "Normal" }},
	-- { 'scalaSpecial', { link = "Operator" }},
	-- { 'scalaInstanceDeclaration', { fg = p.iris }},

	-- Python
	-- { 'pythonOperator', { link = "Keyword" }},

	-- NvimTree
	{ "NvimTreeFolderIcon", { fg = sc.c186 } },
	{ "NvimTreeGitDirty", { fg = sc.c44 } },
	{ "NvimTreeWindowPicker", { fg = sc.c254, bg = sc.c17, bold = true } },

	-- Markdown
	{ "@markup.heading.1", { fg = c.red } },
	{ "@markup.heading.2", { fg = c.orange } },
	{ "@markup.heading.3", { fg = c.yellow } },
	{ "@markup.heading.4", { fg = c.iris } },
	{ "@markup.heading.5", { fg = c.subtle } },
	{ "@markup.heading.6", { fg = c.subtle } },
	{ "@spell.markdown", { fg = c.white, bg = c.black } },
	{ "@markup.list", { fg = c.pink } },
	{ "@markup.list.checked", { fg = c.subtle_green } },
	{ "@markup.list.unchecked", { fg = c.rose } },
	{ "@markup.link", { fg = c.blue } },
	{ "@string.escape", { bg = c.subtle_darker } },

	{ "@markup.strong", {} }, -- remove BOLD rule

	-- HTML
	{ "@tag.attribute", { fg = c.yellow } },

	-- JSON
	{ "jsonKeyword", { link = "Keyword" } },
	{ "jsonBoolean", { link = "Boolean" } },

	-- Diagnostics
	{ "DiagnosticUnderlineError", { sp = "#af0000", underline = true } },
	{ "DiagnosticUnderlineWarn", { sp = "#707000", underline = true } },

	-- Misc
	{ "NvimTreeGitNew", { link = "NvimTreeGitDirty" } },
	{ "NvimTreeGitStaged", { link = "NvimTreeGitDirty" } },
	{ "htmlTagName", { link = "Keyword" } },
	{ "@string.special.symbol", { fg = c.iris } },
	{ "@comment.documentation", { fg = c.subtle_green } },
	{ "Title", { link = "Normal" } },
	{ "SpecialComment", { link = "Special" } },
	{ "CursorColumn", { link = "CursorLine" } },

	-- vim highlight groups
	{ "vimEnvvar", { link = "Constant" } },
	{ "vimHiKeyList", { link = "Constant" } },
	{ "vimCommand", { link = "Keyword" } },
	{ "vimUsrCmd", { link = "Keyword" } },
	{ "vimIsCommand", { link = "Keyword" } },
	{ "vimNotFunc", { link = "Keyword" } },
	{ "vimUserFunc", { link = "Function" } },
	{ "vimCommentTitle", { link = "Special" } },

	-- nvim-cmp
	{ "CmpItemKind", { link = "Type" } },
	{ "CmpItemMenu", { link = "NonText" } },
	{ "CmpItemAbbr", { link = "Identifier" } },
	{ "CmpItemAbbrDeprecated", { link = "Error" } },

	{ "@string.special.url.html", {} }, -- disable underline for <a> in html
	{ "@constructor.php", { link = "Function" } }, -- show constructor as function

	--neotree
	{ "NeoTreeGitUntracked", { link = "NeoTreeGitModified" } },

	--snippets
	{ "SnippetTabstop", { bg = sc.c234 } },
}

for _, d in pairs(definitions) do
	vim.api.nvim_set_hl(0, d[1], d[2])
end
