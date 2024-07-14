return {
	{
		'f-person/git-blame.nvim',
		config = function()
			vim.keymap.set('n', '<leader>gb', "<cmd>GitBlameToggle<CR>", {})
			vim.g.gitblame_message_template = '\t<author> | <date> | <summary> | <sha>'
			vim.g.gitblame_enabled = false
		end,
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
