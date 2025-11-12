return {
	{
		"mason-org/mason.nvim",

		config = function()
			local mason = require("mason")
			mason.setup({
				ensure_installed = {
					"basedpyright",
					"lua-language-server",
					"bash-language-server",
					"ruff",
				},
			})
		end,
	},
}
