-- From: https://github.com/scottmckendry/cyberdream.nvim
local cyberdream_colors_default = {
	bg = "#16181a",
	bgAlt = "#1e2124",
	bgHighlight = "#3c4048",
	fg = "#ffffff",
	lightGrey = "#bbd3ff",
	grey = "#7b8496",
	blue = "#5ea1ff",
	green = "#5eff6c",
	cyan = "#5ef1ff",
	red = "#ff6e5e",
	yellow = "#f1ff5e",
	magenta = "#ff5ef1",
	pink = "#ff5ea0",
	orange = "#ffbd5e",
	purple = "#bd5eff",
}

-- From: https://github.com/scottmckendry/cyberdream.nvim
local cyberdream_colors_light = {
	bg = "#ffffff",
	bgAlt = "#eaeaea",
	bgHighlight = "#acacac",
	fg = "#16181a",
	grey = "#7b8496",
	blue = "#0057d1",
	green = "#008b0c",
	cyan = "#008c99",
	red = "#d11500",
	yellow = "#997b00",
	magenta = "#d100bf",
	pink = "#f40064",
	orange = "#d17c00",
	purple = "#a018ff",
}

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

local c = {
	white = "#e7e7e7",

	red = "#f27775",
	pink = "#ff64b5",
	blue = "#7fbec9",
    fr = "#60c9c3",
    froggy3 = "#64dacb";
    froggy2 = "#4cdac8";
    froggy = "#4dc0b2";
	green = "#64e6ae",
	yellow = "#d0e385",
    y = "#c6db73";
	orange = "#f2a475",
	dead_orange = "#cf9d81",

	dark_green = "#062d06",
	dark_red = "#440606",
	dark_blue = "#141c2e",

	--foam = "#9ccfd8",
	subtle = "#908caa",
	subtle_darker = "#444351",
	love = "#eb6f92",
	rose = "#ea9a97",
	iris = "#c4a7e7",
	subtle_green = "#61977c",
	office_blue = "#31445c",
}

local definitions = {
	{ "Search", { bg = c.office_blue } },
	{ "CurSearch", { link = "Search" } },

	-- Borders
	{ "VertSplit", { fg = sc.c239 } },
	{ "WinSeparator", { fg = sc.c239 } },

	{ "Breakpoint", { fg = sc.c164 } },

	{ "Normal", { fg = c.white } },
	{ "Operator", { link = "Normal" } },

	{ "Number", { fg = c.blue } },
	{ "Float", { link = "Number" } },

	{ "Keyword", { fg = cyberdream_colors_default.pink } },
	{ "Conditional", { link = "Keyword" } },
	{ "Include", { link = "Keyword" } },
	{ "Repeat", { link = "Keyword" } },
	{ "Statement", { link = "Keyword" } },

	{ "Type", { fg = c.fr } },
	{ "Typedef", { link = "Type" } },
	{ "Special", { link = "Type" } },
	{ "SpecialChar", { link = "Type" } },
	{ "SpecialComment", { link = "Type" } },

	{ "String", { fg = c.dead_orange } },

	{ "Function", { fg = c.y } },

	{ "Comment", { fg = sc.c241 } },

	{ "Boolean", { fg = c.rose } },
	{ "Constant", { fg = c.iris } },
	{ "Debug", { fg = c.rose } },
	{ "Define", { fg = c.iris } },
	{ "Delimiter", { fg = c.subtle } },
	{ "Error", { fg = c.love } },
	{ "Exception", { fg = sc.c38 } },
	--{ 'Float', {fg = c151, }},
	{ "Identifier", { fg = c.rose } },
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

	-- General
	{ "StatusLineNC", { fg = sc.c249, bg = sc.c234 } },
	{ "VisualNOS", { fg = sc.c249 } },
	{ "PmenuSbar", { fg = sc.c238 } },
	{ "Cursor", { reverse = true } },
	{ "Visual", { bg = sc.c24 } },
	{ "WildMenu", { fg = sc.c249, bg = sc.c234 } },
	{ "CursorLine", { bg = sc.c236 } },
	{ "CursorLineNr", { fg = sc.c254 } },
	{ "TabLineFill", { bg = sc.c234 } },
	{ "PmenuSel", { fg = sc.c249, bg = sc.c24 } },
	{ "LineNr", { fg = sc.c243 } },
	{ "Directory", { fg = sc.c75 } },
	{ "Identifier", { fg = sc.c254 } },
	{ "TabLine", { fg = sc.c254, bg = sc.c234 } },
	{ "PmenuThumb", { bg = sc.c24 } },
	{ "TabLineSel", { fg = sc.c254, bg = sc.c24 } },
	{ "VertSplit", { fg = sc.c237, bg = sc.c237 } },
	{ "Error", { fg = sc.c160 } },
	{ "Pmenu", { fg = sc.c249, bg = sc.c234 } },
	{ "NonText", { fg = sc.c240 } },
	{ "SignColumn", {} },
	{ "StatusLine", { fg = sc.c249, bg = sc.c234 } },
	{ "StatusLineNC", { fg = sc.c249, bg = sc.c237 } },
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
}

local M = {
	system_colors = sc,
	colors = c,
	definitions = definitions,
}

return M
