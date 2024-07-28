vim.api.nvim_create_autocmd({"Signal"}, {
	callback = function()
		vim.cmd([[ colorscheme blazer ]])
	end
})
