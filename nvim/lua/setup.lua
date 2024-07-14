vim.o.number = true
vim.o.mouse = "a"
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.spell = true
vim.o.spelllang = "en_nz"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undo" -- persistent undo/redo
vim.o.undolevels = 1000
vim.o.undoreload = 10000
vim.o.title = true
vim.o.timeoutlen = 300
vim.go.laststatus = 3 -- 1 statusline for every window
vim.o.inccommand = "split"
vim.opt.list = true
vim.opt.smd = false

if vim.fn.has("termguicolors") == 1 then
	vim.o.termguicolors = true
end
