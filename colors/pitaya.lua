vim.opt.background = "dark"

local cNone = 'NONE'
local c17 = '#00005f'
local c24 = '#005f87'
local c44 = '#00d7d7'
local c51 = '#00ffff'
local c58 = '#5f5f00'
local c75 = '#5fafff'
local c151 = '#afd7af'
local c160 = '#d70000'
local c164 = '#d700d7'
local c186 = '#d7d787'

local c234 = "#1c1c1c"
local c235 = '#262626'
local c236 = '#303030'
local c237 = '#3a3a3a'
local c238 = "#444444"
local c239 = '#4e4e4e'
local c240 = '#585858'
local c241 = "#626262"
local c242 = "#6c6c6c"
local c243 = '#767676'
local c249 = "#b2b2b2"
local c254 = "#e4e4e4"

local cDarkGreen = "#062d06"
local cDarkRed = "#440606"
local cDarkBlue = '#141c2e'

local h = function(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

local p = {
  red = '#f27775',
  subtle = '#908caa',
  love = '#eb6f92',
  gold = '#edd392',
  gold2 = '#f3d292',
  rose = '#ea9a97',
  pine = '#00afd7', --c38
  foam = '#9ccfd8',
  iris = '#c4a7e7',
  iris2 = '#907aa9',
  rotten_orange = '#cf9d81',
  green = '#5aaa82',
  comment_color = c241
}

h('@object.call', { link = "Normal" })

h('Whitespace', { fg = "#400040" })

h("Breakpoint", { fg = c164 })

h('Normal', { fg = "#e7e7e7" })
h('Number', { fg = p.foam })
h('Float', { link = "Number" })
h('Operator', { link = "Normal" })

h('Keyword', { fg = p.red })
h('Conditional', { link = "Keyword" })
h('Include', { link = "Keyword" })
h('Repeat', { link = "Keyword" })

h('Type', { fg = p.green })
h('Typedef', { link = 'Type' })

h('String', { fg = p.rotten_orange })

h('Function', { fg = p.gold2 })

h('Comment', { fg = p.comment_color })

h('Boolean', { fg = p.rose })
h('Constant', { fg = p.love })
--h('Constant', {fg = c187, bg = cNone})
h('Debug', { fg = p.rose })
h('Define', { fg = p.iris })
h('Delimiter', { fg = p.subtle })
h('Error', { fg = p.love })
h('Exception', { fg = p.pine })
--h('Float', {fg = c151, bg = cNone})
h('Identifier', { fg = p.rose })
h('Label', { fg = p.foam })
h('Macro', { fg = p.iris })
h('PreCondit', { fg = p.iris })
h('PreProc', { fg = p.pine })
h('Special', { fg = p.pine })
h('SpecialChar', { fg = p.rose })
h('SpecialComment', { fg = p.iris })
h('Statement', { link = 'Keyword' })
h('StorageClass', { fg = p.foam })
h('Structure', { fg = p.foam })
h('Tag', { fg = p.subtle })
h('Underlined', { underline = true })
h('Todo', { link = 'Comment' })
h('Attribute', { fg = p.green })
--h('Property', { fg = p.foam })
h('Property', { link = "Normal" })

-- General
h('StatusLineNC', { fg = c249, bg = c234 })
h('VisualNOS', { fg = c249 })
h('PmenuSbar', { fg = c238 })
h('Cursor', { reverse = true })
h('Visual', { fg = cNone, bg = c24 })
h('WildMenu', { fg = c249, bg = c234 })
h('CursorLine', { fg = cNone, bg = c236 })
h('CursorLineNr', { fg = c254, bg = cNone })
h('TabLineFill', { fg = cNone, bg = c234 })
h('PmenuSel', { fg = c249, bg = c24 })
h('LineNr', { fg = c243, bg = cNone })
h('Search', { fg = cNone, bg = c238 })
h('Directory', { fg = c75, bg = cNone })
h('Identifier', { fg = c254, bg = cNone })
h('TabLine', { fg = c254, bg = c234 })
h('PmenuThumb', { fg = cNone, bg = c24 })
h('TabLineSel', { fg = c254, bg = c24 })
h('VertSplit', { fg = c237, bg = c237 })
h('Error', { fg = c160 })
h('Pmenu', { fg = c249, bg = c234 })
h('NonText', { fg = c240, bg = cNone })
h('SignColumn', { fg = cNone, bg = cNone })
h('StatusLine', { fg = c249, bg = c234 })
h('StatusLineNC', { fg = c249, bg = c237 })
h('SpecialKey', { fg = c249, bg = cNone })
h('IncSearch', { fg = cNone, bg = c58 })
h('Folded', { fg = c239, bg = c234 })
h('ColorColumn', { fg = cNone, bg = c234 })
h('ErrorMsg', { fg = cNone, bg = c234 })
h('WarningMsg', { fg = cNone, bg = c234 })
h('LspCodeLens', { fg = c241, bg = cNone })
h('Constructor', { link = "Function" })

-- Border
h('NormalFloat', { fg = cNone, bg = cNone })
h('FloatBorder', { fg = c241, bg = cNone })

-- Telescope
h('TelescopeBorder', { fg = c242, bg = cNone })
h('TelescopeSelection', { bg = c237 })

-- Diff
h('DiffChange', { fg = cNone, bg = cDarkBlue })
h('DiffText', { fg = cNone, bg = cDarkBlue })
h('DiffAdd', { fg = cNone, bg = cDarkGreen })
h('DiffDelete', { fg = cNone, bg = cDarkRed })
h('DiffviewDiffDelete', { fg = cDarkRed, bg = cDarkRed })
h('DiffviewDiffDeleteDim', { fg = c235 })
h('FoldColumn', { fg = c51, bg = cNone })

-- Parens
h('MatchParen', { fg = cNone, bg = c58 })

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
h('NvimTreeFolderIcon', { fg = c186, bg = cNone })
h('NvimTreeGitDirty', { fg = c44, bg = cNone })
h('NvimTreeWindowPicker', { fg = c254, bg = c17, bold = true })

-- Markdown
h('markdownH1', { fg = p.red })
h('markdownH2', { fg = "#f2a475" })
h('markdownH3', { fg = p.gold })
h('markdownH4', { fg = c151 })
h('markdownH5', { fg = p.red })
h('markdownH6', { fg = p.red })

-- Diagnostics
h('DiagnosticUnderlineError', { sp = '#af0000', underline = true })
h('DiagnosticUnderlineWarn', { sp = '#707000', underline = true })

-- Misc
h("NvimTreeGitNew", { link = "NvimTreeGitDirty" })
h("NvimTreeGitStaged", { link = "NvimTreeGitDirty" })
h("htmlTagName", { link = "Keyword" })

-- generic highlight groups
h("Title", { link = "Normal" })
h("SpecialComment", { link = "Special" })
h("CursorColumn", { link = "CursorLine" })
--seth("String", {link = "Character"})

-- vim highlight groups
h("vimEnvvar", { link = "Constant" })
h("vimHiKeyList", { link = "Constant" })
h("vimCommand", { link = "Keyword" })
h("vimUsrCmd", { link = "Keyword" })
h("vimIsCommand", { link = "Keyword" })
h("vimNotFunc", { link = "Keyword" })
h("vimUserFunc", { link = "Function" })
h("vimCommentTitle", { link = "Special" })

-- json highlight groups
h("jsonKeyword", { link = "Keyword" })
h("jsonBoolean", { link = "Boolean" })

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
