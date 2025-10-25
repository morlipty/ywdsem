return {
	"folke/lazydev.nvim",
	ft = "lua",
	cmd = "LazyDev",
	config = function()
		local lazydev = require("lazydev")
		lazydev.setup({
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ "nvim-dap-ui" },
			},
		})
	end,
}
