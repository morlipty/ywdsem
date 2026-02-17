return {
	"catppuccin/nvim",

	name = "catppuccin",
	priority = 1000,

	config = function()
		local catppuccin = require("catppuccin")
		catppuccin.setup({
			flavour = "mocha",
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.125,
			},
			float = {
				transparent = true,
				solid = false,
			},
			custom_highlights = function(colors)
				return {
					StatusLine = { bg = colors.none },
					StatusLineNC = { bg = colors.none },
				}
			end,
			integrations = {
				fzf = true,
				mini = {
					enabled = true,
					indentscope_color = "mauve",
				},
			},
		})

		vim.cmd("colorscheme catppuccin")
	end,
}
