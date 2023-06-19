local blue = '#7A7AB8'
local magenta = '#B87AB8'
local red = '#B87A7A'
local yellow = '#B8B87A'
local green = '#7AB87A'
local cyan = '#7AB8B8'

local light_blue = '#BDBDDB'
local light_magenta = '#DBBDDB'
local light_red = '#DBBDBD'
local light_yellow = '#DBDBBD'
local light_green = '#BDDBBD'
local light_cyan = '#BDDBDB'

local dark_blue = '#252537'
local dark_magenta = '#372537'
local dark_red = '#372525'
local dark_yellow = '#373725'
local dark_green = '#253725'
local dark_cyan = '#253737'

local white = '#F5F5FA'
local light_grey = '#DCDCE0'
local grey = '#7A7A7D'
local dark_grey = '#262626'

local background = '#15151F'
local background2 = '#2B2B40'
local background3 = '#3E3E5C'
local background4 = '#55557D'


local blazer = {}

blazer.normal = {
    a = { bg = blue, fg = background, gui = 'bold' },
    b = { bg = background3, fg = light_blue },
    c = { bg = background2, fg = white }
}

blazer.insert = {
    a = { bg = green, fg = background, gui = 'bold' },
    b = { bg = background3, fg = light_green },
    c = { bg = background2, fg = white }
}

blazer.replace = {
    a = { bg = red, fg = background, gui = 'bold' },
    b = { bg = background3, fg = light_red },
    c = { bg = background2, fg = white }
}

blazer.visual = {
    a = { bg = magenta, fg = background, gui = 'bold' },
    b = { bg = background3, fg = light_magenta },
    c = { bg = background2, fg = white }
}

blazer.command = {
    a = { bg = white, fg = background, gui = 'bold' },
    b = { bg = background3, fg = white },
    c = { bg = background2, fg = white }
}

blazer.inactive = {
    a = { bg = grey, fg = background, gui = 'bold' },
    b = { bg = background3, fg = grey },
    c = { bg = background2, fg = grey }
}


--[[ blazer.normal = {
    a = { bg = blue, fg = background, gui = 'bold' },
    b = { bg = dark_blue, fg = light_blue },
    c = { bg = dark_blue, fg = white }
}

blazer.insert = {
    a = { bg = green, fg = background, gui = 'bold' },
    b = { bg = dark_green, fg = light_green },
    c = { bg = dark_green, fg = white }
}

blazer.replace = {
    a = { bg = red, fg = background, gui = 'bold' },
    b = { bg = dark_red, fg = light_red },
    c = { bg = dark_red, fg = white }
}

blazer.visual = {
    a = { bg = magenta, fg = background, gui = 'bold' },
    b = { bg = dark_magenta, fg = light_magenta },
    c = { bg = dark_magenta, fg = white }
}

blazer.command = {
    a = { bg = white, fg = background, gui = 'bold' },
    b = { bg = background2, fg = white },
    c = { bg = background2, fg = white }
}

blazer.inactive = {
    a = { bg = grey, fg = background, gui = 'bold' },
    b = { bg = background2, fg = grey },
    c = { bg = background2, fg = grey }
} ]]


return blazer
