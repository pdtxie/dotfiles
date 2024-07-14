local base = '#F5F5FA'

-- NOTE: bg, grey
local accent_grey = '#DCDCE0'
local grey = '#7A7A7D'
local indent_grey = '#262626'

local bg = '#0C0C12'
local bg2 = '#15151F'
local bg3 = '#2B2B40'
local bg4 = '#3E3E5C'

-- NOTE: colours
local blue = '#7A7AB8'
local magenta = '#B87AB8'
local red = '#B87A7A'
local yellow = '#B8B87A'
local green = '#7AB87A'
local cyan = '#7AB8B8'

local accent_blue = '#BDBDDB'
local accent_magenta = '#DBBDDB'
local accent_red = '#DBBDBD'
local accent_yellow = '#DBDBBD'
local accent_green = '#BDDBBD'
local accent_cyan = '#BDDBDB'

local indent_blue = '#252537'
local indent_magenta = '#372537'
local indent_red = '#372525'
local indent_yellow = '#373725'
local indent_green = '#253725'
local indent_cyan = '#253737'


local blazer = {}

blazer.normal = {
    a = { bg = blue, fg = bg, gui = 'bold' },
    b = { bg = bg3, fg = accent_blue },
    c = { bg = bg2, fg = base }
}

blazer.insert = {
    a = { bg = green, fg = bg, gui = 'bold' },
    b = { bg = bg3, fg = accent_green },
    c = { bg = bg2, fg = base }
}

blazer.replace = {
    a = { bg = red, fg = bg, gui = 'bold' },
    b = { bg = bg3, fg = accent_red },
    c = { bg = bg2, fg = base }
}

blazer.visual = {
    a = { bg = magenta, fg = bg, gui = 'bold' },
    b = { bg = bg3, fg = accent_magenta },
    c = { bg = bg2, fg = base }
}

blazer.command = {
    a = { bg = base, fg = bg, gui = 'bold' },
    b = { bg = bg3, fg = base },
    c = { bg = bg2, fg = base }
}

blazer.inactive = {
    a = { bg = grey, fg = bg, gui = 'bold' },
    b = { bg = bg3, fg = grey },
    c = { bg = bg2, fg = grey }
}


--[[ blazer.normal = {
    a = { bg = blue, fg = bg, gui = 'bold' },
    b = { bg = indent_blue, fg = accent_blue },
    c = { bg = indent_blue, fg = base }
}

blazer.insert = {
    a = { bg = green, fg = bg, gui = 'bold' },
    b = { bg = indent_green, fg = accent_green },
    c = { bg = indent_green, fg = base }
}

blazer.replace = {
    a = { bg = red, fg = bg, gui = 'bold' },
    b = { bg = indent_red, fg = accent_red },
    c = { bg = indent_red, fg = base }
}

blazer.visual = {
    a = { bg = magenta, fg = bg, gui = 'bold' },
    b = { bg = indent_magenta, fg = accent_magenta },
    c = { bg = indent_magenta, fg = base }
}

blazer.command = {
    a = { bg = base, fg = bg, gui = 'bold' },
    b = { bg = bg2, fg = base },
    c = { bg = bg2, fg = base }
}

blazer.inactive = {
    a = { bg = grey, fg = bg, gui = 'bold' },
    b = { bg = bg2, fg = grey },
    c = { bg = bg2, fg = grey }
} ]]


return blazer
