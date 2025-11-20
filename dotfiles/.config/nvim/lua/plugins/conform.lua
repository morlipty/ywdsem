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
				bash = { "shfmt" },
				sh = { "shfmt" },
				lua = { "stylua" },
				xml = { "xmlformatter" },
				toml = { "pyproject-fmt" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				css = { "prettier" },
				python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
				markdown = { "prettier" },
			},
		})
		vim.keymap.set({ "n", "x" }, "<leader><leader>", function()
			require("conform").format({
				lsp_fallback = true,
			})
		end, { desc = "Format file" })
	end,
}
