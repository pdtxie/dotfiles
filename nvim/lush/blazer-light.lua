local blue = '#4C4C8D'
local magenta = '#8C4C8C'
local red = '#8C4C4C'
local yellow = '#8C8C4C'
local green = '#4C8C4C'
local cyan = '#4C8C8C'

local light_blue = '#7A7AB8'
local light_magenta = '#B87ABB'
local light_red = '#B87A7A'
local light_yellow = '#B8B87A'
local light_green = '#7AB87A'
local light_cyan = '#7AB8B8'

local dark_blue = '#BDBDDB'
local dark_magenta = '#DBBDDB'
local dark_red = '#DBBDBD'
local dark_yellow = '#DBDBBD'
local dark_green = '#BDDBBD'
local dark_cyan = '#BDDBDB'

local white = '#0C0C12'
local light_grey = '#262626'
local grey = '#7A7A7D'
local dark_grey = '#DCDCE0'

local background = '#EEEEF5'
local background2 = '#E4E4ED'
local background3 = '#D8D8E3'
local background4 = '#CECEDB'

local lush = require('lush')
local hsl = lush.hsl


local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- neovim
    ColorColumn  { bg = background2 }, -- Columns set with 'colorcolumn'
    Conceal      { bg = background3 }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { }, -- Character under the cursor
    -- lCursor      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = background2 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = background2 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = cyan }, -- Directory names (and other special names in listings)
    DiffAdd      { bg = dark_green }, -- Diff mode: Added line |diff.txt|
    DiffChange   { bg = dark_yellow }, -- Diff mode: Changed line |diff.txt|
    DiffDelete   { bg = dark_red }, -- Diff mode: Deleted line |diff.txt|
    DiffText     { bg = dark_red, fg = red }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer  { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    ErrorMsg     { fg = red }, -- Error messages on the command line
    -- VertSplit    { }, -- Column separating vertically split windows
    Folded       { fg = background3 }, -- Line used for closed folds
    FoldColumn   { fg = background3 }, -- 'foldcolumn'
    SignColumn   { fg = background3 }, -- Column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { bg = dark_yellow, fg = yellow }, -- |:substitute| replacement text highlighting
    LineNr       { fg = background4 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = background4 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = white, bg = background4, gui = "bold" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = light_blue, gui = "bold" }, -- |more-prompt|
    NonText      { fg = background4 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = white }, -- Normal text
    NormalFloat  { bg = background2 }, -- Normal text in floating windows.
    -- NormalNC     { }, -- normal text in non-current windows
    Pmenu        { bg = background2 }, -- Popup menu: Normal item.
    PmenuSel     { bg = background3 }, -- Popup menu: Selected item.
    PmenuSbar    { bg = background3 }, -- Popup menu: Scrollbar.
    PmenuThumb   { bg = background4 }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = light_blue, gui = "bold" }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { bg = dark_cyan, fg = cyan }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { bg = dark_cyan, fg = cyan }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey   { fg = light_magenta }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { sp = red, gui = "underline" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap     { sp = yellow, gui = "underline" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal   { sp = background3, gui = "underline" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { sp = background4, gui = "underline" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- StatusLine   { }, -- Status line of current window
    -- StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- Tab pages line, not active tab page label
    -- TabLineFill  { }, -- Tab pages line, where there are no labels
    -- TabLineSel   { }, -- Tab pages line, active tab page label
    Title        { fg = magenta, gui = "bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = background3, gui = "bold" }, -- Visual mode selection
    VisualNOS    { bg = background3 }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = red }, -- Warning messages
    Whitespace   { fg = background4 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator { fg = background3 }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu     { bg = dark_cyan, fg = cyan }, -- Current match in 'wildmenu' completion


    -- syntax:
    Comment        { fg = grey, gui = "italic" }, -- Any comment

    Constant       { fg = light_blue }, -- (*) Any constant
    String         { fg = light_green }, --   A string constant: "this is a string"
    Character      { fg = light_green }, --   A character constant: 'c', '\n'
    Number         { fg = light_blue }, --   A number constant: 234, 0xff
    Boolean        { fg = light_blue }, --   A boolean constant: TRUE, false
    Float          { fg = light_blue }, --   A floating point constant: 2.3e10

    Identifier     { fg = white }, -- (*) Any variable name
    Function       { fg = blue }, --   Function name (also: methods for classes)

    Statement      { fg = magenta }, -- (*) Any statement
    Conditional    { fg = magenta }, --   if, then, else, endif, switch, etc.
    Repeat         { fg = magenta }, --   for, do, while, etc.
    Label          { fg = magenta }, --   case, default, etc.
    Operator       { fg = light_magenta }, --   "sizeof", "+", "*", etc.
    Keyword        { fg = magenta }, --   any other keyword
    Exception      { fg = magenta }, --   try, catch, throw

    PreProc        { fg = light_magenta }, -- (*) Generic Preprocessor
    Include        { fg = magenta }, --   Preprocessor #include
    Define         { fg = light_magenta }, --   Preprocessor #define
    Macro          { fg = light_magenta }, --   Same as Define
    PreCondit      { fg = light_magenta }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = light_yellow }, -- (*) int, long, char, etc.
    StorageClass   { fg = light_yellow }, --   static, register, volatile, etc.
    Structure      { fg = light_yellow }, --   struct, union, enum, etc.
    Typedef        { fg = light_yellow }, --   A typedef

    Special        { fg = light_grey }, -- (*) Any special symbol
    SpecialChar    { fg = light_grey }, --   Special character in a constant
    Tag            { fg = light_grey }, --   You can use CTRL-] on this
    Delimiter      { fg = light_grey }, --   Character that needs attention
    SpecialComment { fg = light_grey }, --   Special things inside a comment (e.g. '\n')
    Debug          { fg = light_grey }, --   Debugging statements

    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Ignore         { fg = background }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { bg = red, fg = white }, -- Any erroneous construct
    Todo           { bg = yellow, fg = white }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX


    -- lsp client
    DiagnosticError            { fg = red } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = yellow } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = cyan } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = light_grey } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError   { fg = red, gui = "underline" } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { fg = yellow, gui = "underline" } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { fg = cyan, gui = "underline" } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { fg = light_grey, gui = "underline"} , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.


    -- treesitter
    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
}
end)

return theme
