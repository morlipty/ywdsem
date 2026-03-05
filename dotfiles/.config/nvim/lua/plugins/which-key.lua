return {
	"folke/which-key.nvim",

	event = "VeryLazy",

	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "helix",
			replace = { ["<leader>"] = "SPC" },
			show_help = false,
			triggers = {
				{ "<auto>", mode = "nixsotc" },
				{ "s", mode = { "n", "x" } },
			},
		})
	end,
}
