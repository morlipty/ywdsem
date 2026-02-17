return {
	"catgoose/nvim-colorizer.lua",

	event = "BufReadPre",

	config = function()
		local colorizer = require("colorizer")
		colorizer.setup({
			user_default_options = {
				rgb_fn = true,
			},
		})
	end,
}
