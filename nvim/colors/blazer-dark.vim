local colors = {
Normal = {fg = "#F5F5FA"},
Boolean = {fg = "#BDBDDB"},
Character = {fg = "#BDDBBD"},
ColorColumn = {bg = "#15151F"},
Comment = {fg = "#7A7A7D", italic = true},
Conceal = {bg = "#2B2B40"},
Conditional = {fg = "#B87AB8"},
Constant = {fg = "#BDBDDB"},
CursorColumn = {bg = "#15151F"},
CursorLine = {bg = "#15151F"},
CursorLineNr = {fg = "#3E3E5C"},
Debug = {fg = "#DCDCE0"},
Define = {fg = "#DBBDDB"},
Delimiter = {fg = "#DCDCE0"},
DiagnosticError = {fg = "#B87A7A"},
DiagnosticHint = {fg = "#DCDCE0"},
DiagnosticInfo = {fg = "#7AB8B8"},
DiagnosticUnderlineError = {fg = "#B87A7A", underline = true},
DiagnosticUnderlineHint = {fg = "#DCDCE0", underline = true},
DiagnosticUnderlineInfo = {fg = "#7AB8B8", underline = true},
DiagnosticUnderlineWarn = {fg = "#B8B87A", underline = true},
DiagnosticWarn = {fg = "#B8B87A"},
DiffAdd = {bg = "#253725"},
DiffChange = {bg = "#373725"},
DiffDelete = {bg = "#372525"},
DiffText = {fg = "#B87A7A", bg = "#372525"},
Directory = {fg = "#7AB8B8"},
Error = {fg = "#F5F5FA", bg = "#B87A7A"},
ErrorMsg = {fg = "#B87A7A"},
Exception = {fg = "#B87AB8"},
Float = {fg = "#BDBDDB"},
FoldColumn = {fg = "#2B2B40"},
Folded = {fg = "#2B2B40"},
Function = {fg = "#7A7AB8"},
Identifier = {fg = "#F5F5FA"},
Ignore = {fg = "#0C0C12"},
Include = {fg = "#B87AB8"},
Keyword = {fg = "#B87AB8"},
Label = {fg = "#B87AB8"},
LineNr = {fg = "#3E3E5C"},
Macro = {fg = "#DBBDDB"},
MatchParen = {fg = "#F5F5FA", bg = "#3E3E5C", bold = true},
MoreMsg = {fg = "#BDBDDB", bold = true},
NonText = {fg = "#3E3E5C"},
NormalFloat = {bg = "#15151F"},
Number = {fg = "#BDBDDB"},
Operator = {fg = "#DBBDDB"},
Pmenu = {bg = "#15151F"},
PmenuSbar = {bg = "#2B2B40"},
PmenuSel = {bg = "#2B2B40"},
PmenuThumb = {bg = "#3E3E5C"},
PreCondit = {fg = "#DBBDDB"},
PreProc = {fg = "#DBBDDB"},
Question = {fg = "#BDBDDB", bold = true},
QuickFixLine = {fg = "#7AB8B8", bg = "#253737"},
Repeat = {fg = "#B87AB8"},
Search = {fg = "#7AB8B8", bg = "#253737"},
SignColumn = {fg = "#2B2B40"},
Special = {fg = "#DCDCE0"},
SpecialChar = {fg = "#DCDCE0"},
SpecialComment = {fg = "#DCDCE0"},
SpecialKey = {fg = "#DBBDDB"},
SpellBad = {sp = "#B87A7A", underline = true},
SpellCap = {sp = "#B8B87A", underline = true},
SpellLocal = {sp = "#2B2B40", underline = true},
SpellRare = {sp = "#3E3E5C", underline = true},
Statement = {fg = "#B87AB8"},
StorageClass = {fg = "#DBDBBD"},
String = {fg = "#BDDBBD"},
Structure = {fg = "#DBDBBD"},
Substitute = {fg = "#B8B87A", bg = "#373725"},
Tag = {fg = "#DCDCE0"},
Title = {fg = "#B87AB8", bold = true},
Todo = {fg = "#F5F5FA", bg = "#B8B87A"},
Type = {fg = "#DBDBBD"},
Typedef = {fg = "#DBDBBD"},
Underlined = {underline = true},
Visual = {bg = "#2B2B40", bold = true},
VisualNOS = {bg = "#2B2B40"},
WarningMsg = {fg = "#B87A7A"},
Whitespace = {fg = "#3E3E5C"},
WildMenu = {fg = "#7AB8B8", bg = "#253737"},
Winseparator = {fg = "#2B2B40"},
}

-- colorschemes generally want to do this
vim.cmd("highlight clear")
vim.cmd("set t_Co=256")
vim.cmd("let g:colors_name='blazer.nvim'")

-- apply highlight groups
for group, attrs in pairs(colors) do
  vim.api.nvim_set_hl(0, group, attrs)
end
