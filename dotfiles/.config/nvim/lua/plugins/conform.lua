return {
	"stevearc/conform.nvim",

	config = function()
		local conform = require("conform")
		conform.setup({
			default_format_opts = {
				quiet = false,
				async = false,
				timeout_ms = 3000,
				lsp_format = "fallback",
			},

			formatters_by_ft = {
				python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
				lua = { "stylua" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				xml = { "xmlformatter" },
				toml = { "pyproject-fmt" },
				json = { "oxmft" },
				jsonc = { "oxmft" },
				yaml = { "oxmft" },
				css = { "oxmft" },
				markdown = { "oxmft" },
			},
		})

		vim.keymap.set({ "n", "x" }, "<leader>f", function()
			conform.format({})
		end, { desc = "Format file" })
	end,
}
