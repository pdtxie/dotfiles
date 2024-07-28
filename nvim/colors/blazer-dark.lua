local colors = {
	Normal = {fg = "#F5F5FA"},
	Boolean = {fg = "#BDBDDB"},
	["@boolean"] = {link = "Boolean"},
	Character = {fg = "#BDDBBD"},
	["@character"] = {link = "Character"},
	ColorColumn = {bg = "#15151F"},
	Comment = {fg = "#7A7A7D", italic = true},
	["@comment"] = {link = "Comment"},
	["@text.literal"] = {link = "Comment"},
	Conceal = {bg = "#2B2B40"},
	Conditional = {fg = "#B87AB8"},
	["@conditional"] = {link = "Conditional"},
	Constant = {fg = "#BDBDDB"},
	["@constant"] = {link = "Constant"},
	Cursor = {fg = "#0C0C12", bg = "#F5F5FA"},
	CursorColumn = {bg = "#15151F"},
	CursorIM = {fg = "#0C0C12", bg = "#F5F5FA"},
	CursorLine = {bg = "#15151F"},
	CursorLineNr = {fg = "#3E3E5C"},
	Debug = {fg = "#DCDCE0", bg = "#B87A7A"},
	["@debug"] = {link = "Debug"},
	Define = {fg = "#DBBDDB"},
	["@constant.macro"] = {link = "Define"},
	["@define"] = {link = "Define"},
	Delimiter = {fg = "#DCDCE0"},
	["@punctuation"] = {link = "Delimiter"},
	DiagnosticError = {fg = "#B87A7A"},
	DiagnosticHint = {fg = "#7A7A7D"},
	DiagnosticInfo = {fg = "#7AB8B8"},
	DiagnosticUnderlineError = {fg = "#B87A7A", underline = true},
	DiagnosticUnderlineHint = {fg = "#7A7A7D", underline = true},
	DiagnosticUnderlineInfo = {fg = "#7AB8B8", underline = true},
	DiagnosticUnderlineWarn = {fg = "#B8B87A", underline = true},
	DiagnosticWarn = {fg = "#B8B87A"},
	DiffAdd = {bg = "#253725"},
	DiffChange = {bg = "#373725"},
	DiffDelete = {bg = "#372525"},
	DiffText = {fg = "#B87A7A", bg = "#372525"},
	Directory = {fg = "#7AB8B8"},
	Error = {fg = "#372525", bg = "#B87A7A"},
	ErrorMsg = {fg = "#B87A7A"},
	Exception = {fg = "#B87AB8"},
	["@exception"] = {link = "Exception"},
	Float = {fg = "#BDBDDB"},
	["@float"] = {link = "Float"},
	FoldColumn = {fg = "#2B2B40"},
	Folded = {fg = "#2B2B40"},
	Function = {fg = "#7A7AB8"},
	["@function"] = {link = "Function"},
	["@method"] = {link = "Function"},
	Identifier = {fg = "#F5F5FA"},
	["@field"] = {link = "Identifier"},
	["@namespace"] = {link = "Identifier"},
	["@parameter"] = {link = "Identifier"},
	["@property"] = {link = "Identifier"},
	["@text.reference"] = {link = "Identifier"},
	["@variable"] = {link = "Identifier"},
	Ignore = {fg = "#0C0C12"},
	Include = {fg = "#B87AB8"},
	["@include"] = {link = "Include"},
	Keyword = {fg = "#B87AB8"},
	["@keyword"] = {link = "Keyword"},
	Label = {fg = "#B87AB8"},
	["@label"] = {link = "Label"},
	LineNr = {fg = "#3E3E5C"},
	Macro = {fg = "#DBBDDB"},
	["@function.macro"] = {link = "Macro"},
	["@macro"] = {link = "Macro"},
	MatchParen = {fg = "#F5F5FA", bg = "#3E3E5C", bold = true},
	MoreMsg = {fg = "#BDBDDB", bold = true},
	NonText = {fg = "#3E3E5C"},
	NormalFloat = {bg = "#15151F"},
	Number = {fg = "#BDBDDB"},
	["@number"] = {link = "Number"},
	Operator = {fg = "#DBBDDB"},
	["@operator"] = {link = "Operator"},
	Pmenu = {bg = "#15151F"},
	PmenuSbar = {bg = "#2B2B40"},
	PmenuSel = {bg = "#2B2B40"},
	PmenuThumb = {bg = "#3E3E5C"},
	PreCondit = {fg = "#DBBDDB"},
	PreProc = {fg = "#DBBDDB"},
	["@preproc"] = {link = "PreProc"},
	Question = {fg = "#BDBDDB", bold = true},
	QuickFixLine = {fg = "#7AB8B8", bg = "#253737"},
	Repeat = {fg = "#B87AB8"},
	["@repeat"] = {link = "Repeat"},
	Search = {fg = "#7AB8B8", bg = "#253737"},
	SignColumn = {fg = "#2B2B40"},
	Special = {fg = "#DCDCE0"},
	["@constant.builtin"] = {link = "Special"},
	["@constructor"] = {link = "Special"},
	["@function.builtin"] = {link = "Special"},
	SpecialChar = {fg = "#DCDCE0"},
	["@character.special"] = {link = "SpecialChar"},
	["@string.escape"] = {link = "SpecialChar"},
	["@string.special"] = {link = "SpecialChar"},
	SpecialComment = {fg = "#DCDCE0"},
	SpecialKey = {fg = "#DBBDDB"},
	SpellBad = {sp = "#B87A7A", underline = true},
	SpellCap = {sp = "#B8B87A", underline = true},
	SpellLocal = {sp = "#2B2B40", underline = true},
	SpellRare = {sp = "#3E3E5C", underline = true},
	Statement = {fg = "#B87AB8"},
	StorageClass = {fg = "#DBDBBD"},
	["@storageclass"] = {link = "StorageClass"},
	String = {fg = "#BDDBBD"},
	["@string"] = {link = "String"},
	Structure = {fg = "#DBDBBD"},
	["@structure"] = {link = "Structure"},
	Substitute = {fg = "#B8B87A", bg = "#373725"},
	Tag = {fg = "#DCDCE0"},
	["@tag"] = {link = "Tag"},
	Title = {fg = "#B87AB8", bold = true},
	["@text.title"] = {link = "Title"},
	Todo = {fg = "#373725", bg = "#B8B87A"},
	["@text.todo"] = {link = "Todo"},
	Type = {fg = "#DBDBBD"},
	["@type"] = {link = "Type"},
	Typedef = {fg = "#DBDBBD"},
	["@type.definition"] = {link = "Typedef"},
	Underlined = {underline = true},
	["@text.underline"] = {link = "Underlined"},
	["@text.uri"] = {link = "Underlined"},
	Visual = {bg = "#2B2B40", bold = true},
	VisualNOS = {bg = "#2B2B40"},
	WarningMsg = {fg = "#B87A7A"},
	Whitespace = {fg = "#3E3E5C"},
	WildMenu = {fg = "#7AB8B8", bg = "#253737"},
	Winseparator = {fg = "#2B2B40"},
	lCursor = {fg = "#3E3E5C", bg = "#F5F5FA"},
}

vim.cmd("highlight clear")
vim.cmd("set t_Co=256")
vim.g.colors_name = "blazer-dark"

for group, attrs in pairs(colors) do
  vim.api.nvim_set_hl(0, group, attrs)
end