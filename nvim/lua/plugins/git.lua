return {
	{
		'f-person/git-blame.nvim',
		config = function()
			vim.g.gitblame_enabled = 0
		end
	},
	{
		"NeogitOrg/neogit",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			local neogit = require("neogit")
			neogit.setup({
				integrations = {
					diffview = true,
				},
			})
		end
	},
	{ 
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim"
	}
}
