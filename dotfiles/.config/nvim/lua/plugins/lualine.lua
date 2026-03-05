return {
	"nvim-lualine/lualine.nvim",

	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				globalstatus = true,
				section_separators = {
					left = "",
					right = "",
				},
				disabled_filetypes = {
					statusline = {
						"ministarter",
					},
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "" },
					},
				},
				lualine_c = {
					{
						"filename",
						path = 3,
					},
				},
				lualine_x = {},
				lualine_y = {
					{
						"filetype",
						icon_only = false,
					},
					{
						"lsp_status",
						icon = "",
						symbols = {
							spinner = { "====", " ===", "  ==", "   =", "    ", "    ", "=   ", "==  ", "=== ", "====" },
							done = "<OK>",
						},
					},
				},
				lualine_z = {
					{
						"location",
						separator = { right = "" },
					},
				},
			},
		})
	end,
}
