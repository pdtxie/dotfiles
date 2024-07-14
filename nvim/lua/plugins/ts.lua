return {
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = {
					enable = true,
					disable = { "c", "tex", "latex" }, -- Use LSP
				},
				indent = {
					enable = true,
					disable = { "python" },
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({})
		end,
	},
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({
				snippet_engine = "vsnip",
			})
		end,
		dependencies = "nvim-treesitter/nvim-treesitter",
	}
}
