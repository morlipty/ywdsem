---@diagnostic disable: missing-fields
return {
	"OXY2DEV/markview.nvim",

	lazy = false,

	config = function()
		local markview = require("markview")
		local presets = require("markview.presets")
		local checkboxes = require("markview.extras.checkboxes")

		checkboxes.setup({})

		markview.setup({

			preview = {
				debounce = 0,
				icon_provider = "mini",
				modes = { "i", "n", "no", "c" },
				hybrid_modes = { "i", "n", "no", "c" },
			},

			markdown = {
				headings = presets.headings.slanted,
				tables = presets.tables.rounded,
				horizontal_rules = presets.horizontal_rules.thick,
			},

			markdown_inline = {
				checkboxes = presets.checkboxes.nerd,
			},
		})
	end,
}
