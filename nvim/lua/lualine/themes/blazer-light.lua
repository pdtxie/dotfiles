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


local blazer = {}

blazer.normal = {
    a = { bg = bg4, fg = blue, gui = 'bold' },
    b = { bg = bg3, fg = accent_grey },
    c = { bg = bg2, fg = base }
}

blazer.insert = {
    a = { bg = bg4, fg = green, gui = 'bold' },
    b = { bg = bg3, fg = accent_grey },
    c = { bg = bg2, fg = base }
}

blazer.replace = {
    a = { bg = bg4, fg = red, gui = 'bold' },
    b = { bg = bg3, fg = accent_grey },
    c = { bg = bg2, fg = base }
}

blazer.visual = {
    a = { bg = bg4, fg = magenta, gui = 'bold' },
    b = { bg = bg3, fg = accent_grey },
    c = { bg = bg2, fg = base }
}

blazer.command = {
    a = { bg = bg4, fg = base, gui = 'bold' },
    b = { bg = bg3, fg = base },
    c = { bg = bg2, fg = base }
}

blazer.inactive = {
    a = { bg = bg4, fg = grey, gui = 'bold' },
    b = { bg = bg3, fg = accent_grey },
    c = { bg = bg2, fg = grey }
}

return blazer
