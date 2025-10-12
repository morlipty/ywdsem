return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 1000,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
		},
	},
}
