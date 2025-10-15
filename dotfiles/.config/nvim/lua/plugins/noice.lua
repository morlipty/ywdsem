return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
