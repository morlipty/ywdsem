return {
	{
		"nvim-treesitter/nvim-treesitter-context",
	},

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",

		config = function()
			local treesitter = require("nvim-treesitter")
			treesitter.install({
				"python",
				"lua",
				"bash",
				"fish",
				"regex",
				"toml",
				"yaml",
				"markdown",
				"markdown_inline",
				"latex",
			})
		end,
	},
}
