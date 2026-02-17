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
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				css = { "prettier" },
				markdown = { "prettier" },
			},
		})

		vim.keymap.set({ "n", "x" }, "<leader>f", function()
			require("conform").format({})
		end, { desc = "Format file" })
	end,
}
