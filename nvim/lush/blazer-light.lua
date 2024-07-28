local base = '#0C0C12'

-- NOTE: bg, grey
local accent_grey = '#262626'
local grey = '#7A7A7D'
local indent_grey = '#DCDCE0'

local bg = '#F5F5FA'
local bg2 = '#EEEEF5'
local bg3 = '#E4E4ED'
local bg4 = '#D8D8E3'

-- NOTE: colours
local blue = '#7A7AB8'
local magenta = '#B87AB8'
local red = '#B87A7A'
local yellow = '#B8B87A'
local green = '#7AB87A'
local cyan = '#7AB8B8'

local accent_blue = '#2B2B5C'
local accent_magenta = '#5C2B5C'
local accent_red = '#5C2B2B'
local accent_yellow = '#5C5C2B'
local accent_green = '#2B5C2B'
local accent_cyan = '#2B5C5C'

local indent_blue = '#BDBDDB'
local indent_magenta = '#DBBDDB'
local indent_red = '#DBBDBD'
local indent_yellow = '#DBDBBD'
local indent_green = '#BDDBBD'
local indent_cyan = '#BDDBDB'


local lush = require('lush')
local hsl = lush.hsl


local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- neovim
    ColorColumn  { bg = bg2 }, -- Columns set with 'colorcolumn'
    Conceal      { bg = bg3 }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { bg = base, fg = bg }, -- Character under the cursor
    lCursor      { bg = base, fg = bg4 }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM     { bg = base, fg = bg }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = bg2 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = bg2 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = cyan }, -- Directory names (and other special names in listings)
    DiffAdd      { fg = base, bg = indent_green }, -- Diff mode: Added line |diff.txt|
    DiffChange   { fg = base, bg = indent_yellow }, -- Diff mode: Changed line |diff.txt|
    DiffDelete   { fg = base, bg = indent_red }, -- Diff mode: Deleted line |diff.txt|
    DiffText     { bg = indent_red, fg = red }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer  { }, -- Filler lines (~) after the end of the buffer. By default, this is highaccented like |hl-NonText|.
    -- TermCursor   { }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    ErrorMsg     { fg = red }, -- Error messages on the command line
    -- VertSplit    { }, -- Column separating vertically split windows
    Folded       { fg = bg3 }, -- Line used for closed folds
    FoldColumn   { fg = bg3 }, -- 'foldcolumn'
    SignColumn   { fg = bg3 }, -- Column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highaccenting; also used for the text replaced with ":s///c"
    Substitute   { bg = indent_yellow, fg = yellow }, -- |:substitute| replacement text highaccenting
    LineNr       { fg = bg4 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = bg4 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = base, bg = bg4, gui = "bold" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = accent_blue, gui = "bold" }, -- |more-prompt|
    NonText      { fg = bg4 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = base }, -- Normal text
    NormalFloat  { bg = bg2 }, -- Normal text in floating windows.
    -- NormalNC     { }, -- normal text in non-current windows
    Pmenu        { bg = bg2 }, -- Popup menu: Normal item.
    PmenuSel     { bg = bg3 }, -- Popup menu: Selected item.
    PmenuSbar    { bg = bg3 }, -- Popup menu: Scrollbar.
    PmenuThumb   { bg = bg4 }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = accent_blue, gui = "bold" }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { bg = indent_cyan, fg = cyan }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { bg = indent_cyan, fg = cyan }, -- Last search pattern highaccenting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey   { fg = accent_magenta }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' basespace. |hl-Whitespace|
    SpellBad     { sp = red, gui = "underline" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highaccenting used otherwise.
    SpellCap     { sp = yellow, gui = "underline" }, -- Word that should start with a capital. |spell| Combined with the highaccenting used otherwise.
    SpellLocal   { sp = bg3, gui = "underline" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highaccenting used otherwise.
    SpellRare    { sp = bg4, gui = "underline" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highaccenting used otherwise.
    -- StatusLine   { }, -- Status line of current window
    -- StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- Tab pages line, not active tab page label
    -- TabLineFill  { }, -- Tab pages line, where there are no labels
    -- TabLineSel   { }, -- Tab pages line, active tab page label
    Title        { fg = magenta, gui = "bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = bg3, gui = "bold" }, -- Visual mode selection
    VisualNOS    { bg = bg3 }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = red }, -- Warning messages
    Whitespace   { fg = bg4 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator { fg = bg3 }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu     { bg = indent_cyan, fg = cyan }, -- Current match in 'wildmenu' completion


    -- syntax:
    Comment        { fg = grey, gui = "italic" }, -- Any comment

    Constant       { fg = accent_blue }, -- (*) Any constant
    String         { fg = accent_green }, --   A string constant: "this is a string"
    Character      { fg = accent_green }, --   A character constant: 'c', '\n'
    Number         { fg = accent_blue }, --   A number constant: 234, 0xff
    Boolean        { fg = accent_blue }, --   A boolean constant: TRUE, false
    Float          { fg = accent_blue }, --   A floating point constant: 2.3e10

    Identifier     { fg = base }, -- (*) Any variable name
    Function       { fg = blue }, --   Function name (also: methods for classes)

    Statement      { fg = magenta }, -- (*) Any statement
    Conditional    { fg = magenta }, --   if, then, else, endif, switch, etc.
    Repeat         { fg = magenta }, --   for, do, while, etc.
    Label          { fg = magenta }, --   case, default, etc.
    Operator       { fg = accent_magenta }, --   "sizeof", "+", "*", etc.
    Keyword        { fg = magenta }, --   any other keyword
    Exception      { fg = magenta }, --   try, catch, throw

    PreProc        { fg = accent_magenta }, -- (*) Generic Preprocessor
    Include        { fg = magenta }, --   Preprocessor #include
    Define         { fg = accent_magenta }, --   Preprocessor #define
    Macro          { fg = accent_magenta }, --   Same as Define
    PreCondit      { fg = accent_magenta }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = accent_yellow }, -- (*) int, long, char, etc.
    StorageClass   { fg = accent_yellow }, --   static, register, volatile, etc.
    Structure      { fg = accent_yellow }, --   struct, union, enum, etc.
    Typedef        { fg = accent_yellow }, --   A typedef

    Special        { fg = accent_grey }, -- (*) Any special symbol
    SpecialChar    { fg = accent_grey }, --   Special character in a constant
    Tag            { fg = accent_grey }, --   You can use CTRL-] on this
    Delimiter      { fg = accent_grey }, --   Character that needs attention
    SpecialComment { fg = accent_grey }, --   Special things inside a comment (e.g. '\n')
    Debug          { bg = indent_red, fg = accent_grey }, --   Debugging statements

    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Ignore         { fg = bg }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { bg = indent_red, fg = accent_red }, -- Any erroneous construct
    Todo           { bg = indent_yellow, fg = accent_yellow }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX


    -- lsp client
    DiagnosticError            { fg = red } , -- Used as the base highaccent group. Other Diagnostic highaccents link to this by default (except Underline)
    DiagnosticWarn             { fg = yellow } , -- Used as the base highaccent group. Other Diagnostic highaccents link to this by default (except Underline)
    DiagnosticInfo             { fg = cyan } , -- Used as the base highaccent group. Other Diagnostic highaccents link to this by default (except Underline)
    DiagnosticHint             { fg = grey } , -- Used as the base highaccent group. Other Diagnostic highaccents link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError   { fg = red, gui = "underline" } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { fg = yellow, gui = "underline" } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { fg = cyan, gui = "underline" } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { fg = grey, gui = "underline"} , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.


    -- treesitter
    sym"@text.literal"      { Comment }, -- Comment
    sym"@text.reference"    { Identifier }, -- Identifier
    sym"@text.title"        { Title }, -- Title
    sym"@text.uri"          { Underlined }, -- Underlined
    sym"@text.underline"    { Underlined }, -- Underlined
    sym"@text.todo"         { Todo }, -- Todo
    sym"@comment"           { Comment }, -- Comment
    sym"@punctuation"       { Delimiter }, -- Delimiter
    sym"@constant"          { Constant }, -- Constant
    sym"@constant.builtin"  { Special }, -- Special
    sym"@constant.macro"    { Define }, -- Define
    sym"@define"            { Define }, -- Define
    sym"@macro"             { Macro }, -- Macro
    sym"@string"            { String }, -- String
    sym"@string.escape"     { SpecialChar }, -- SpecialChar
    sym"@string.special"    { SpecialChar }, -- SpecialChar
    sym"@character"         { Character }, -- Character
    sym"@character.special" { SpecialChar }, -- SpecialChar
    sym"@number"            { Number }, -- Number
    sym"@boolean"           { Boolean }, -- Boolean
    sym"@float"             { Float }, -- Float
    sym"@function"          { Function }, -- Function
    sym"@function.builtin"  { Special }, -- Special
    sym"@function.macro"    { Macro }, -- Macro
    sym"@parameter"         { Identifier }, -- Identifier
    sym"@method"            { Function }, -- Function
    sym"@field"             { Identifier }, -- Identifier
    sym"@property"          { Identifier }, -- Identifier
    sym"@constructor"       { Special }, -- Special
    sym"@conditional"       { Conditional }, -- Conditional
    sym"@repeat"            { Repeat }, -- Repeat
    sym"@label"             { Label }, -- Label
    sym"@operator"          { Operator }, -- Operator
    sym"@keyword"           { Keyword }, -- Keyword
    sym"@exception"         { Exception }, -- Exception
    sym"@variable"          { Identifier }, -- Identifier
    sym"@type"              { Type }, -- Type
    sym"@type.definition"   { Typedef }, -- Typedef
    sym"@storageclass"      { StorageClass }, -- StorageClass
    sym"@structure"         { Structure }, -- Structure
    sym"@namespace"         { Identifier }, -- Identifier
    sym"@include"           { Include }, -- Include
    sym"@preproc"           { PreProc }, -- PreProc
    sym"@debug"             { Debug }, -- Debug
    sym"@tag"               { Tag }, -- Tag
}
end)

return theme
