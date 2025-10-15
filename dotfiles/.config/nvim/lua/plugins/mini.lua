return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.align").setup({})
		require("mini.move").setup({})
	end,
}
