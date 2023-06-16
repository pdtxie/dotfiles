local alpha = require("alpha")
local theta = require("alpha.themes.theta")
local config = theta.config


-- Set header
local neovim = {
"                                            ██              ",
"                                            ▀▀              ",
" ██▄████▄   ▄████▄    ▄████▄   ██▄  ▄██   ████     ████▄██▄ ",
" ██▀   ██  ██▄▄▄▄██  ██▀  ▀██   ██  ██      ██     ██ ██ ██ ",
" ██    ██  ██▀▀▀▀▀▀  ██    ██   ▀█▄▄█▀      ██     ██ ██ ██ ",
" ██    ██  ▀██▄▄▄▄█  ▀██▄▄██▀    ████    ▄▄▄██▄▄▄  ██ ██ ██ ",
" ▀▀    ▀▀    ▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀▀▀▀▀▀▀  ▀▀ ▀▀ ▀▀ ",
}

local hiblue = "StartLogoBlue"
local higreen = "StartLogoGreen"

local function header()
  local lines = {}
  for _,line_chars in pairs(neovim) do
    -- Count number of spaces in first 30 chars (not included in hl col for some reason)
    -- I have no idea why 88 and 86 work when the string itself is only 60 chars
    local _,count = string.gsub(string.sub(line_chars, 1, 88), " ", " ")
    local mid = 86 - count -- Get number of non space chars
    local line = {
      type = "text",
      val = line_chars,
      opts = {
	hl = {{hiblue, 0, mid}, {higreen, mid, 99999}},
	shrink_margin = false,
	position = "center",
      },
    }
    table.insert(lines, line)
  end

  local output = {
    type = "group",
    val = lines,
    opts = { position = "center", },
  }
  return output
end


local dashboard = require("alpha.themes.dashboard")

config.layout[1] = { type = "padding", val = 8 }

config.layout[6] = {
    type = "group",
    val = {
        { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        dashboard.button("e", "  New file", "<cmd>ene<CR>"),
        dashboard.button("f", "  File Explorer", "<cmd>NvimTreeOpen<CR>"),
        dashboard.button("c", "  NVIM Config", "<cmd>NvimTreeOpen ~/.config/nvim/<CR><cmd>edit ~/.config/nvim/init.lua<CR>"),
        dashboard.button("u", "  Update plugins", "<cmd>PackerSync<CR>"),
        dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
    },
    position = "center",
}


config.layout[2] = header()
alpha.setup(config)


-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Disable the statusline, tabline and cmdline while the alpha dashboard is open
autocmd('User', {
  pattern = 'AlphaReady',
  desc = 'disable status, tabline and cmdline for alpha',
  callback = function()
	  vim.go.laststatus = 0
	  vim.opt.cmdheight = 0
  end,
  })
autocmd('BufUnload', {
  buffer = 0,
  desc = 'enable status, tabline and cmdline after alpha',
  callback = function()
          vim.go.laststatus = 2
	  vim.opt.cmdheight = 1
  end,
  })

