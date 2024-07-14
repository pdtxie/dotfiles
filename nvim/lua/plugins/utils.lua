return {
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
		wants = "nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()

			require("nvim-tree").setup({
				hijack_cursor = true,
				view = {
					width = 25,
				},
			})
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{ 
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {}
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				ignore = "^$",
				toggler = {
					line = "gll",
					block = "gbb",
				},
				opleader = {
					line = "gl",
					block = "gb",
				},
			})
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup()
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
		config = function()
			require("config.alpha")
		end,
	}
}
