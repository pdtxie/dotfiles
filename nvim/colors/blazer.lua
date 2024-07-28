local colors = {
	Normal = {fg = "#0C0C12"},
	Boolean = {fg = "#2B2B5C"},
	["@boolean"] = {link = "Boolean"},
	Character = {fg = "#2B5C2B"},
	["@character"] = {link = "Character"},
	ColorColumn = {bg = "#EEEEF5"},
	Comment = {fg = "#7A7A7D", italic = true},
	["@comment"] = {link = "Comment"},
	["@text.literal"] = {link = "Comment"},
	Conceal = {bg = "#E4E4ED"},
	Conditional = {fg = "#B87AB8"},
	["@conditional"] = {link = "Conditional"},
	Constant = {fg = "#2B2B5C"},
	["@constant"] = {link = "Constant"},
	Cursor = {fg = "#F5F5FA", bg = "#0C0C12"},
	CursorColumn = {bg = "#EEEEF5"},
	CursorIM = {fg = "#F5F5FA", bg = "#0C0C12"},
	CursorLine = {bg = "#EEEEF5"},
	CursorLineNr = {fg = "#D8D8E3"},
	Debug = {fg = "#262626", bg = "#DBBDBD"},
	["@debug"] = {link = "Debug"},
	Define = {fg = "#5C2B5C"},
	["@constant.macro"] = {link = "Define"},
	["@define"] = {link = "Define"},
	Delimiter = {fg = "#262626"},
	["@punctuation"] = {link = "Delimiter"},
	DiagnosticError = {fg = "#B87A7A"},
	DiagnosticHint = {fg = "#7A7A7D"},
	DiagnosticInfo = {fg = "#7AB8B8"},
	DiagnosticUnderlineError = {fg = "#B87A7A", underline = true},
	DiagnosticUnderlineHint = {fg = "#7A7A7D", underline = true},
	DiagnosticUnderlineInfo = {fg = "#7AB8B8", underline = true},
	DiagnosticUnderlineWarn = {fg = "#B8B87A", underline = true},
	DiagnosticWarn = {fg = "#B8B87A"},
	DiffAdd = {fg = "#0C0C12", bg = "#BDDBBD"},
	DiffChange = {fg = "#0C0C12", bg = "#DBDBBD"},
	DiffDelete = {fg = "#0C0C12", bg = "#DBBDBD"},
	DiffText = {fg = "#B87A7A", bg = "#DBBDBD"},
	Directory = {fg = "#7AB8B8"},
	Error = {fg = "#5C2B2B", bg = "#DBBDBD"},
	ErrorMsg = {fg = "#B87A7A"},
	Exception = {fg = "#B87AB8"},
	["@exception"] = {link = "Exception"},
	Float = {fg = "#2B2B5C"},
	["@float"] = {link = "Float"},
	FoldColumn = {fg = "#E4E4ED"},
	Folded = {fg = "#E4E4ED"},
	Function = {fg = "#7A7AB8"},
	["@function"] = {link = "Function"},
	["@method"] = {link = "Function"},
	Identifier = {fg = "#0C0C12"},
	["@field"] = {link = "Identifier"},
	["@namespace"] = {link = "Identifier"},
	["@parameter"] = {link = "Identifier"},
	["@property"] = {link = "Identifier"},
	["@text.reference"] = {link = "Identifier"},
	["@variable"] = {link = "Identifier"},
	Ignore = {fg = "#F5F5FA"},
	Include = {fg = "#B87AB8"},
	["@include"] = {link = "Include"},
	Keyword = {fg = "#B87AB8"},
	["@keyword"] = {link = "Keyword"},
	Label = {fg = "#B87AB8"},
	["@label"] = {link = "Label"},
	LineNr = {fg = "#D8D8E3"},
	Macro = {fg = "#5C2B5C"},
	["@function.macro"] = {link = "Macro"},
	["@macro"] = {link = "Macro"},
	MatchParen = {fg = "#0C0C12", bg = "#D8D8E3", bold = true},
	MoreMsg = {fg = "#2B2B5C", bold = true},
	NonText = {fg = "#D8D8E3"},
	NormalFloat = {bg = "#EEEEF5"},
	Number = {fg = "#2B2B5C"},
	["@number"] = {link = "Number"},
	Operator = {fg = "#5C2B5C"},
	["@operator"] = {link = "Operator"},
	Pmenu = {bg = "#EEEEF5"},
	PmenuSbar = {bg = "#E4E4ED"},
	PmenuSel = {bg = "#E4E4ED"},
	PmenuThumb = {bg = "#D8D8E3"},
	PreCondit = {fg = "#5C2B5C"},
	PreProc = {fg = "#5C2B5C"},
	["@preproc"] = {link = "PreProc"},
	Question = {fg = "#2B2B5C", bold = true},
	QuickFixLine = {fg = "#7AB8B8", bg = "#BDDBDB"},
	Repeat = {fg = "#B87AB8"},
	["@repeat"] = {link = "Repeat"},
	Search = {fg = "#7AB8B8", bg = "#BDDBDB"},
	SignColumn = {fg = "#E4E4ED"},
	Special = {fg = "#262626"},
	["@constant.builtin"] = {link = "Special"},
	["@constructor"] = {link = "Special"},
	["@function.builtin"] = {link = "Special"},
	SpecialChar = {fg = "#262626"},
	["@character.special"] = {link = "SpecialChar"},
	["@string.escape"] = {link = "SpecialChar"},
	["@string.special"] = {link = "SpecialChar"},
	SpecialComment = {fg = "#262626"},
	SpecialKey = {fg = "#5C2B5C"},
	SpellBad = {sp = "#B87A7A", underline = true},
	SpellCap = {sp = "#B8B87A", underline = true},
	SpellLocal = {sp = "#E4E4ED", underline = true},
	SpellRare = {sp = "#D8D8E3", underline = true},
	Statement = {fg = "#B87AB8"},
	StorageClass = {fg = "#5C5C2B"},
	["@storageclass"] = {link = "StorageClass"},
	String = {fg = "#2B5C2B"},
	["@string"] = {link = "String"},
	Structure = {fg = "#5C5C2B"},
	["@structure"] = {link = "Structure"},
	Substitute = {fg = "#B8B87A", bg = "#DBDBBD"},
	Tag = {fg = "#262626"},
	["@tag"] = {link = "Tag"},
	Title = {fg = "#B87AB8", bold = true},
	["@text.title"] = {link = "Title"},
	Todo = {fg = "#5C5C2B", bg = "#DBDBBD"},
	["@text.todo"] = {link = "Todo"},
	Type = {fg = "#5C5C2B"},
	["@type"] = {link = "Type"},
	Typedef = {fg = "#5C5C2B"},
	["@type.definition"] = {link = "Typedef"},
	Underlined = {underline = true},
	["@text.underline"] = {link = "Underlined"},
	["@text.uri"] = {link = "Underlined"},
	Visual = {bg = "#E4E4ED", bold = true},
	VisualNOS = {bg = "#E4E4ED"},
	WarningMsg = {fg = "#B87A7A"},
	Whitespace = {fg = "#D8D8E3"},
	WildMenu = {fg = "#7AB8B8", bg = "#BDDBDB"},
	Winseparator = {fg = "#E4E4ED"},
	lCursor = {fg = "#D8D8E3", bg = "#0C0C12"},
}

vim.cmd("highlight clear")
vim.cmd("set t_Co=256")
vim.g.colors_name = "blazer-light"

for group, attrs in pairs(colors) do
  vim.api.nvim_set_hl(0, group, attrs)
end