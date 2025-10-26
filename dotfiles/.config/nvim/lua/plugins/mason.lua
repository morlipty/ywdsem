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
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			local mason_dap = require("mason-nvim-dap")
			mason_dap.setup({
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
				},
				ensure_installed = {
					"python",
					"lua",
					"bash",
				},
			})
		end,
	},
}
