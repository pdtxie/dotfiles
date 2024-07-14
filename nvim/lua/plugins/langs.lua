return {
	-- md
	{
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	},

	-- emmet, for html/svelte
	{ 'mattn/emmet-vim'},

	-- vimtext, kinda bad
	{
		'lervag/vimtex',
		config = function()
			vim.g.tex_flavor = "latex"
			vim.g.latex_view_general_viewer = "zathura"
			vim.g.vimtex_view_method = "zathura"

			tex_exe = "latexmk"
			tex_opts = {
				"-xelatex",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
				"-pvc",
			}

			vim.g.vimtex_compiler_latexmk = {
				executable = tex_exe,
				options = tex_opts,
			}
		end
	},
	
	-- css, hex colours
	{
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("colorizer").setup()
		end,
	}
}
