return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha",
		transparent_background = true,
		integrations = {
			notify = true,
			fzf = true,
			mini = {
				enabled = true,
				indentscope_color = "mauve",
			},
		},
	},
}
