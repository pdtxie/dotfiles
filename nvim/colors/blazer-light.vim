local colors = {
Normal = {fg = "#0C0C12"},
Boolean = {fg = "#7A7AB8"},
Character = {fg = "#7AB87A"},
ColorColumn = {bg = "#EEEEF5"},
Comment = {fg = "#7A7A7D", italic = true},
Conceal = {bg = "#E4E4ED"},
Conditional = {fg = "#8C4C8C"},
Constant = {fg = "#7A7AB8"},
CursorColumn = {bg = "#EEEEF5"},
CursorLine = {bg = "#EEEEF5"},
CursorLineNr = {fg = "#D8D8E3"},
Debug = {fg = "#262626"},
Define = {fg = "#B87ABB"},
Delimiter = {fg = "#262626"},
DiagnosticError = {fg = "#8C4C4C"},
DiagnosticHint = {fg = "#262626"},
DiagnosticInfo = {fg = "#4C8C8C"},
DiagnosticUnderlineError = {fg = "#8C4C4C", underline = true},
DiagnosticUnderlineHint = {fg = "#262626", underline = true},
DiagnosticUnderlineInfo = {fg = "#4C8C8C", underline = true},
DiagnosticUnderlineWarn = {fg = "#8C8C4C", underline = true},
DiagnosticWarn = {fg = "#8C8C4C"},
DiffAdd = {fg = "#0C0C12", bg = "#E4F1E4"},
DiffChange = {fg = "#0C0C12", bg = "#F1F1E4"},
DiffDelete = {fg = "#0C0C12", bg = "#F1E4E4"},
DiffText = {fg = "#8C4C4C", bg = "#F1E4E4"},
Directory = {fg = "#4C8C8C"},
Error = {fg = "#0C0C12", bg = "#8C4C4C"},
ErrorMsg = {fg = "#8C4C4C"},
Exception = {fg = "#8C4C8C"},
Float = {fg = "#7A7AB8"},
FoldColumn = {fg = "#E4E4ED"},
Folded = {fg = "#E4E4ED"},
Function = {fg = "#4C4C8D"},
Identifier = {fg = "#0C0C12"},
Ignore = {fg = "#F5F5FA"},
Include = {fg = "#8C4C8C"},
Keyword = {fg = "#8C4C8C"},
Label = {fg = "#8C4C8C"},
LineNr = {fg = "#D8D8E3"},
Macro = {fg = "#B87ABB"},
MatchParen = {fg = "#0C0C12", bg = "#D8D8E3", bold = true},
MoreMsg = {fg = "#7A7AB8", bold = true},
NonText = {fg = "#D8D8E3"},
NormalFloat = {bg = "#EEEEF5"},
Number = {fg = "#7A7AB8"},
Operator = {fg = "#B87ABB"},
Pmenu = {bg = "#EEEEF5"},
PmenuSbar = {bg = "#E4E4ED"},
PmenuSel = {bg = "#E4E4ED"},
PmenuThumb = {bg = "#D8D8E3"},
PreCondit = {fg = "#B87ABB"},
PreProc = {fg = "#B87ABB"},
Question = {fg = "#7A7AB8", bold = true},
QuickFixLine = {fg = "#4C8C8C", bg = "#E4F1F1"},
Repeat = {fg = "#8C4C8C"},
Search = {fg = "#4C8C8C", bg = "#E4F1F1"},
SignColumn = {fg = "#E4E4ED"},
Special = {fg = "#262626"},
SpecialChar = {fg = "#262626"},
SpecialComment = {fg = "#262626"},
SpecialKey = {fg = "#B87ABB"},
SpellBad = {sp = "#8C4C4C", underline = true},
SpellCap = {sp = "#8C8C4C", underline = true},
SpellLocal = {sp = "#E4E4ED", underline = true},
SpellRare = {sp = "#D8D8E3", underline = true},
Statement = {fg = "#8C4C8C"},
StorageClass = {fg = "#B8B87A"},
String = {fg = "#7AB87A"},
Structure = {fg = "#B8B87A"},
Substitute = {fg = "#8C8C4C", bg = "#F1F1E4"},
Tag = {fg = "#262626"},
Title = {fg = "#8C4C8C", bold = true},
Todo = {fg = "#0C0C12", bg = "#8C8C4C"},
Type = {fg = "#B8B87A"},
Typedef = {fg = "#B8B87A"},
Underlined = {underline = true},
Visual = {bg = "#E4E4ED", bold = true},
VisualNOS = {bg = "#E4E4ED"},
WarningMsg = {fg = "#8C4C4C"},
Whitespace = {fg = "#D8D8E3"},
WildMenu = {fg = "#4C8C8C", bg = "#E4F1F1"},
Winseparator = {fg = "#E4E4ED"},
}

-- colorschemes generally want to do this
vim.cmd("highlight clear")
vim.cmd("set t_Co=256")
vim.cmd("let g:colors_name='blazer.nvim'")

-- apply highlight groups
for group, attrs in pairs(colors) do
  vim.api.nvim_set_hl(0, group, attrs)
end