vim.opt.background = "dark"

local h = function(name, val)
	vim.api.nvim_set_hl(0, name, val)
end

--local color = {
--	--pink = "#ff45a6",
--	pink = "#ff64b5",
--	--blue = "#4ed4ff",
--	blue = "#6ab9c9",
--	green = "#64e6ae",
--	yellow = "#d0e385",
--
--	orange = "#f2a475",
--
--	dark_green = "#062d06",
--	dark_red = "#440606",
--	dark_blue = "#141c2e",
--
--	red = "#f27775",
--	subtle = "#908caa",
--	subtle_darker = "#444351",
--	love = "#eb6f92",
--	rose = "#ea9a97",
--	foam = "#9ccfd8",
--	iris = "#c4a7e7",
--	--iris2 = "#907aa9",
--	subtle_green = "#61977c",
--}

-- TODO: obsolete
--h("@object.call", { link = "Normal" })
--h("Whitespace", { fg = "#400040" })

local pitaya_theme = require("colors.pitaya_theme")

local sc = pitaya_theme.system_colors
local c = pitaya_theme.colors

local x = {
	-- Borders
	{ "VertSplit", { fg = sc.c239 } },
	{ "WinSeparator", { fg = sc.c239 } },

	{ "Breakpoint", { fg = sc.c164 } },

	{ "Normal", { fg = c.white } },
	{ "Operator", { link = "Normal" } },

	{ "Number", { fg = c.foam } },
	{ "Float", { link = "Number" } },

	{ "Keyword", { fg = c.pink } },
	{ "Conditional", { link = "Keyword" } },
	{ "Include", { link = "Keyword" } },
	{ "Repeat", { link = "Keyword" } },
	{ "Statement", { link = "Keyword" } },

	{ "Type", { fg = c.blue } },
	{ "Typedef", { link = "Type" } },

	{ "String", { fg = c.dead_orange } },

	{ "Function", { fg = c.yellow } },

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
	{ "Label", { fg = c.foam } },
	{ "Macro", { fg = c.iris } },
	{ "PreCondit", { fg = c.iris } },
	{ "PreProc", { fg = sc.c38 } },

	{ "Special", { fg = c.blue } },
	{ "SpecialChar", { fg = c.blue } },
	{ "SpecialComment", { fg = c.blue } },

	{ "StorageClass", { fg = c.foam } },
	{ "Structure", { fg = c.foam } },
	{ "Tag", { fg = c.subtle } },
	{ "Underlined", { underline = true } },
	{ "Todo", { link = "Comment" } },
	{ "Attribute", { fg = c.yellow } },
	--{ 'Property', { fg = p.foam }},
	{ "Property", { link = "Normal" } },

	-- General
	--{ "StatusLineNC", { fg = c249, bg = c234 } },
	--{ "VisualNOS", { fg = c249 } },
	--{ "PmenuSbar", { fg = c238 } },
	--{ "Cursor", { reverse = true } },
	--{ "Visual", { bg = c24 } },
	--{ "WildMenu", { fg = c249, bg = c234 } },
	--{ "CursorLine", { bg = c236 } },
	--{ "CursorLineNr", { fg = c254 } },
	--{ "TabLineFill", { bg = c234 } },
	--{ "PmenuSel", { fg = c249, bg = c24 } },
	--{ "LineNr", { fg = c243 } },
	--{ "Search", { bg = "#31445c" } },
	--{ "Directory", { fg = c75 } },
	--{ "Identifier", { fg = c254 } },
	--{ "TabLine", { fg = c254, bg = c234 } },
	--{ "PmenuThumb", { bg = c24 } },
	--{ "TabLineSel", { fg = c254, bg = c24 } },
	--{ "VertSplit", { fg = c237, bg = c237 } },
	--{ "Error", { fg = c160 } },
	--{ "Pmenu", { fg = c249, bg = c234 } },
	--{ "NonText", { fg = c240 } },
	--{ "SignColumn", {} },
	--{ "StatusLine", { fg = c249, bg = c234 } },
	--{ "StatusLineNC", { fg = c249, bg = c237 } },
	--{ "SpecialKey", { fg = c249 } },
	--{ "IncSearch", { bg = c58 } },
	--{ "Folded", { fg = c239, bg = c234 } },
	--{ "cColumn", { bg = c234 } },
	--{ "ErrorMsg", { bg = c234 } },
	--{ "WarningMsg", { bg = c234 } },
	--{ "LspCodeLens", { fg = c241 } },
	--{ "Constructor", { link = "Function" } },

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
	-- { 'scalaCapitalWord', { fg = p.foam }},
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

	-- TODO: those highlights are partly obsolete
	-- tree-sitter highlight groups
	{ "@special", { link = "Special" } },
	{ "@string", { link = "String" } },
	{ "@operator", { link = "Operator" } },
	{ "@function", { link = "Function" } },
	{ "@funcMacro", { link = "Function" } },
	{ "@error", { link = "Error" } },
	{ "@punctDelimiter", { link = "PunctDelimiter" } },
	{ "@punctBracket", { link = "PunctBracket" } },
	{ "@punctSpecial", { link = "PunctSpecial" } },
	{ "@constant", { link = "Constant" } },
	{ "@constBuiltin", { link = "Constant" } },
	{ "@constMacro", { link = "Type" } },
	{ "@stringRegex", { link = "String" } },
	{ "@stringEscape", { link = "Operator" } },
	{ "@character", { link = "String" } },
	{ "@number", { link = "Number" } },
	{ "@boolean", { link = "Boolean" } },
	{ "@float", { link = "Float" } },
	{ "@annotation", { link = "Comment" } },
	{ "@attribute", { link = "Attribute" } },
	{ "@namespace", { link = "Namespace" } },
	{ "@parameter", { link = "Normal" } },
	{ "@parameterReference", { link = "Normal" } },
	{ "@method", { link = "Function" } },
	{ "@field", { link = "Field" } },
	{ "@property", { link = "Property" } },
	{ "@constructor", { link = "Constructor" } },
	{ "@conditional", { link = "Conditional" } },
	{ "@repeat", { link = "Repeat" } },
	{ "@label", { link = "Label" } },
	{ "@keyword", { link = "Keyword" } },
	{ "@keywordFunction", { link = "Keyword" } },
	{ "@keywordOperator", { link = "Keyword" } },
	{ "@exception", { link = "Exception" } },
	{ "@type", { link = "Type" } },
	{ "@typeBuiltin", { link = "Type" } },
	{ "@structure", { link = "Type" } },
	{ "@include", { link = "Include" } },
	{ "@variable", { link = "Normal" } },
	{ "@variableBuiltin", { link = "Normal" } },
	{ "@text", { link = "Normal" } },
	{ "@strong", { link = "Strong" } },
	{ "@emphasis", { link = "Emphasis" } },
	{ "@underline", { link = "Underline" } },
	{ "@title", { link = "Title" } },
	{ "@literal", { link = "Literal" } },
	{ "@uRI", { link = "Identifier" } },
	{ "@tag", { link = "Tag" } },
	{ "@tagDelimiter", { link = "TagDeliWarn" } },
	{ "@type.qualifier", { link = "Keyword" } },
	{ "@method.call", { link = "Function" } },
}

for _, v in pairs(x) do
	h(v[1], v[2])
end
