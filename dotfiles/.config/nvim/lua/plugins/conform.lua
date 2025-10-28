return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			bash = { "shfmt" },
			sh = { "shfmt" },
			lua = { "stylua" },
			xml = { "xmlformatter" },
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
			css = { "prettier" },
			python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
		},
	},
}
