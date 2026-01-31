return {
	"folke/lazydev.nvim",

	ft = "lua",

	config = function()
		local lazydev = require("lazydev")
		lazydev.setup({
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		})
	end,
}
