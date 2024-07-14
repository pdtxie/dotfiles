toggle_colourcolumn = function()
	if vim.o.colorcolumn == "80" then
		return "<cmd>set cc=<CR>"
	else
		return "<cmd>set cc=80<CR>"
	end
end

vim.keymap.set({"n", "i"}, "<C-k>", "<cmd>move -2<cr>")
vim.keymap.set({"n", "i"}, "<C-j>", "<cmd>move +1<cr>")
vim.keymap.set("v", "<C-k>", "xkP`[V`]")
vim.keymap.set("v", "<C-j>", "xp`[V`]")

vim.keymap.set("n", "<C-h>", "xhP")
vim.keymap.set("n", "<C-l>", "xp")
vim.keymap.set("v", "<C-h>", "dhP`[1v")
vim.keymap.set("v", "<C-l>", "dp`[1v")

vim.keymap.set("v", "<C-c>", '"+y<cr>')
vim.keymap.set("v", "<C-x>", '"+d<cr>')
vim.keymap.set({"v", "n"}, "<C-a>", "ggVG")
vim.keymap.set("i", "<C-a>", "<esc>ggVG")

vim.keymap.set("n", "<leader>80", toggle_colourcolumn())

-- telescope keybindings in telescope config file
