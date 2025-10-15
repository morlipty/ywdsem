return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"python",
			"regex",
			"bash",
		},
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
