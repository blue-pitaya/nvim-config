-- May look at this: https://github.com/tjdevries/colorbuddy.nvim

local h = function(name, val)
	vim.api.nvim_set_hl(0, name, val)
end

vim.opt.background = "dark"

local cNone = "NONE"
local c17 = "#00005f"
local c24 = "#005f87"
local c38 = "#00afd7"
local c44 = "#00d7d7"
local c51 = "#00ffff"
local c58 = "#5f5f00"
local c75 = "#5fafff"
local c151 = "#afd7af"
local c160 = "#d70000"
local c164 = "#d700d7"
local c186 = "#d7d787"

local c234 = "#1c1c1c"
local c235 = "#262626"
local c236 = "#303030"
local c237 = "#3a3a3a"
local c238 = "#444444"
local c239 = "#4e4e4e"
local c240 = "#585858"
local c241 = "#626262"
local c242 = "#6c6c6c"
local c243 = "#767676"
local c249 = "#b2b2b2"
local c254 = "#e4e4e4"

local color = {
	--pink = "#ff45a6",
	pink = "#ff64b5",
	--blue = "#4ed4ff",
	blue = "#6ab9c9",
	green = "#64e6ae",
	yellow = "#d0e385",

	orange = "#f2a475",

	dark_green = "#062d06",
	dark_red = "#440606",
	dark_blue = "#141c2e",

	red = "#f27775",
	subtle = "#908caa",
	subtle_darker = "#444351",
	love = "#eb6f92",
	rose = "#ea9a97",
	foam = "#9ccfd8",
	iris = "#c4a7e7",
	--iris2 = "#907aa9",
	subtle_green = "#61977c",

	string_color = "#cf9d81",
	comment_color = c241,
}

--Syntax
h("@object.call", { link = "Normal" })

h("Whitespace", { fg = "#400040" })

h("Breakpoint", { fg = c164 })

h("Normal", { fg = "#e7e7e7" })
h("Number", { fg = color.foam })
h("Float", { link = "Number" })
h("Operator", { link = "Normal" })

h("Keyword", { fg = color.pink })
h("Conditional", { link = "Keyword" })
h("Include", { link = "Keyword" })
h("Repeat", { link = "Keyword" })
h("Statement", { link = "Keyword" })

h("Type", { fg = color.blue })
h("Typedef", { link = "Type" })

h("String", { fg = color.string_color })

h("Function", { fg = color.yellow })

h("Comment", { fg = color.comment_color })

h("Boolean", { fg = color.rose })
h("Constant", { fg = color.iris })
h("Debug", { fg = color.rose })
h("Define", { fg = color.iris })
h("Delimiter", { fg = color.subtle })
h("Error", { fg = color.love })
h("Exception", { fg = c38 })
--h('Float', {fg = c151, bg = cNone})
h("Identifier", { fg = color.rose })
h("Label", { fg = color.foam })
h("Macro", { fg = color.iris })
h("PreCondit", { fg = color.iris })
h("PreProc", { fg = c38 })

h("Special", { fg = color.blue })
h("SpecialChar", { fg = color.blue })
h("SpecialComment", { fg = color.blue })

h("StorageClass", { fg = color.foam })
h("Structure", { fg = color.foam })
h("Tag", { fg = color.subtle })
h("Underlined", { underline = true })
h("Todo", { link = "Comment" })
h("Attribute", { fg = color.yellow })
--h('Property', { fg = p.foam })
h("Property", { link = "Normal" })

-- General
h("StatusLineNC", { fg = c249, bg = c234 })
h("VisualNOS", { fg = c249 })
h("PmenuSbar", { fg = c238 })
h("Cursor", { reverse = true })
h("Visual", { fg = cNone, bg = c24 })
h("WildMenu", { fg = c249, bg = c234 })
h("CursorLine", { fg = cNone, bg = c236 })
h("CursorLineNr", { fg = c254, bg = cNone })
h("TabLineFill", { fg = cNone, bg = c234 })
h("PmenuSel", { fg = c249, bg = c24 })
h("LineNr", { fg = c243, bg = cNone })
h("Search", { fg = cNone, bg = "#31445c" })
h("Directory", { fg = c75, bg = cNone })
h("Identifier", { fg = c254, bg = cNone })
h("TabLine", { fg = c254, bg = c234 })
h("PmenuThumb", { fg = cNone, bg = c24 })
h("TabLineSel", { fg = c254, bg = c24 })
h("VertSplit", { fg = c237, bg = c237 })
h("Error", { fg = c160 })
h("Pmenu", { fg = c249, bg = c234 })
h("NonText", { fg = c240, bg = cNone })
h("SignColumn", { fg = cNone, bg = cNone })
h("StatusLine", { fg = c249, bg = c234 })
h("StatusLineNC", { fg = c249, bg = c237 })
h("SpecialKey", { fg = c249, bg = cNone })
h("IncSearch", { fg = cNone, bg = c58 })
h("Folded", { fg = c239, bg = c234 })
h("ColorColumn", { fg = cNone, bg = c234 })
h("ErrorMsg", { fg = cNone, bg = c234 })
h("WarningMsg", { fg = cNone, bg = c234 })
h("LspCodeLens", { fg = c241, bg = cNone })
h("Constructor", { link = "Function" })

-- Border
h("NormalFloat", { fg = cNone, bg = cNone })
h("FloatBorder", { fg = c241, bg = cNone })

-- Telescope
h("TelescopeBorder", { fg = c242, bg = cNone })
h("TelescopeSelection", { bg = c237 })

-- Diff
h("DiffChange", { fg = cNone, bg = color.dark_blue })
h("DiffText", { fg = cNone, bg = color.dark_blue })
h("DiffAdd", { fg = cNone, bg = color.dark_green })
h("DiffDelete", { fg = cNone, bg = color.dark_red })
h("DiffviewDiffDelete", { fg = color.dark_red, bg = color.dark_red })
h("DiffviewDiffDeleteDim", { fg = c235 })
h("FoldColumn", { fg = c51, bg = cNone })

-- Parens
h("MatchParen", { fg = cNone, bg = c58 })

-- Scala
-- h('scalaKeywordModifier', { link = 'Keyword' })
-- h('scalaOperator', { link = 'Operator' })
-- h('scalaCapitalWord', { fg = p.foam })
-- h('scalaCaseFollowing', { link = "Normal" })
-- h('scalaAkkaSpecialWord', { link = "Normal" })
-- h('scalatestSpecialWord', { link = "Normal" })
-- h('scalaSpecial', { link = "Operator" })
-- h('scalaInstanceDeclaration', { fg = p.iris })

-- Python
-- h('pythonOperator', { link = "Keyword" })

-- NvimTree
h("NvimTreeFolderIcon", { fg = c186, bg = cNone })
h("NvimTreeGitDirty", { fg = c44, bg = cNone })
h("NvimTreeWindowPicker", { fg = c254, bg = c17, bold = true })

-- Markdown
h("@markup.heading.1", { fg = color.red })
h("@markup.heading.2", { fg = color.orange })
h("@markup.heading.3", { fg = color.yellow })
h("@markup.heading.4", { fg = color.iris })
h("@markup.heading.5", { fg = color.subtle })
h("@markup.heading.6", { fg = color.subtle })
h("@markup.list", { fg = color.pink })
h("@markup.list.checked", { fg = color.subtle_green })
h("@markup.list.unchecked", { fg = color.rose })
h("@markup.link", { fg = color.blue })
h("@string.escape", { bg = color.subtle_darker })

-- HTML
h("@tag.attribute", { fg = color.yellow })

-- JSON
h("jsonKeyword", { link = "Keyword" })
h("jsonBoolean", { link = "Boolean" })

-- Diagnostics
h("DiagnosticUnderlineError", { sp = "#af0000", underline = true })
h("DiagnosticUnderlineWarn", { sp = "#707000", underline = true })

-- Misc
h("NvimTreeGitNew", { link = "NvimTreeGitDirty" })
h("NvimTreeGitStaged", { link = "NvimTreeGitDirty" })
h("htmlTagName", { link = "Keyword" })
h("@string.special.symbol", { fg = color.iris })
h("@comment.documentation", { fg = color.subtle_green })
h("Title", { link = "Normal" })
h("SpecialComment", { link = "Special" })
h("CursorColumn", { link = "CursorLine" })

-- vim highlight groups
h("vimEnvvar", { link = "Constant" })
h("vimHiKeyList", { link = "Constant" })
h("vimCommand", { link = "Keyword" })
h("vimUsrCmd", { link = "Keyword" })
h("vimIsCommand", { link = "Keyword" })
h("vimNotFunc", { link = "Keyword" })
h("vimUserFunc", { link = "Function" })
h("vimCommentTitle", { link = "Special" })

-- nvim-cmp
h("CmpItemKind", { link = "Type" })
h("CmpItemMenu", { link = "NonText" })
h("CmpItemAbbr", { link = "Identifier" })
h("CmpItemAbbrDeprecated", { link = "Error" })

-- TODO: those highlights are partly obsolete
-- tree-sitter highlight groups
h("@special", { link = "Special" })
h("@string", { link = "String" })
h("@operator", { link = "Operator" })
h("@function", { link = "Function" })
h("@funcMacro", { link = "Function" })
h("@error", { link = "Error" })
h("@punctDelimiter", { link = "PunctDelimiter" })
h("@punctBracket", { link = "PunctBracket" })
h("@punctSpecial", { link = "PunctSpecial" })
h("@constant", { link = "Constant" })
h("@constBuiltin", { link = "Constant" })
h("@constMacro", { link = "Type" })
h("@stringRegex", { link = "String" })
h("@stringEscape", { link = "Operator" })
h("@character", { link = "String" })
h("@number", { link = "Number" })
h("@boolean", { link = "Boolean" })
h("@float", { link = "Float" })
h("@annotation", { link = "Comment" })
h("@attribute", { link = "Attribute" })
h("@namespace", { link = "Namespace" })
h("@parameter", { link = "Normal" })
h("@parameterReference", { link = "Normal" })
h("@method", { link = "Function" })
h("@field", { link = "Field" })
h("@property", { link = "Property" })
h("@constructor", { link = "Constructor" })
h("@conditional", { link = "Conditional" })
h("@repeat", { link = "Repeat" })
h("@label", { link = "Label" })
h("@keyword", { link = "Keyword" })
h("@keywordFunction", { link = "Keyword" })
h("@keywordOperator", { link = "Keyword" })
h("@exception", { link = "Exception" })
h("@type", { link = "Type" })
h("@typeBuiltin", { link = "Type" })
h("@structure", { link = "Type" })
h("@include", { link = "Include" })
h("@variable", { link = "Normal" })
h("@variableBuiltin", { link = "Normal" })
h("@text", { link = "Normal" })
h("@strong", { link = "Strong" })
h("@emphasis", { link = "Emphasis" })
h("@underline", { link = "Underline" })
h("@title", { link = "Title" })
h("@literal", { link = "Literal" })
h("@uRI", { link = "Identifier" })
h("@tag", { link = "Tag" })
h("@tagDelimiter", { link = "TagDeliWarn" })
h("@type.qualifier", { link = "Keyword" })
h("@method.call", { link = "Function" })
