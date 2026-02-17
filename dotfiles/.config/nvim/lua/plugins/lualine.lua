return {
	"nvim-lualine/lualine.nvim",

	config = function()
		local catppuccin = require("lualine.themes.catppuccin")
		for _, mode in pairs(catppuccin) do
			if mode.c then
				mode.c.bg = "none"
			end
		end

		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = catppuccin,
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
						separator = { left = " " },
						right_padding = 2,
					},
				},
				lualine_c = {
					{ "filename", path = 3 },
				},
				lualine_x = {},
				lualine_y = {
					{
						"filetype",
						icon_only = false,
					},
					{
						"lsp_status",
						symbols = { done = "Done" },
					},
				},
				lualine_z = {
					{
						"location",
						separator = { right = " " },
						left_padding = 2,
					},
				},
			},
		})
	end,
}
