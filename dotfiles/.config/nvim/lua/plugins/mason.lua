return {
	{
		"mason-org/mason.nvim",

		config = function()
			local mason = require("mason")
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			local mr = require("mason-registry")
			local ensure = {
				-- Python
				"basedpyright",
				"ruff",
				-- Lua
				"lua-language-server",
				"stylua",
				-- Bash
				"shfmt",
				"shellcheck",
				"bash-language-server",
				-- XML
				"xmlformatter",
				-- TOML
				"pyproject-fmt",
				-- Markdown
				"marksman",
				-- Spell
				"harper-ls",
				-- OXC
				"oxfmt",
			}

			mr:on("package:install:success", function()
				vim.defer_fn(function()
					vim.api.nvim_exec_autocmds("FileType", {
						buffer = vim.api.nvim_get_current_buf(),
					})
				end, 100)
			end)

			mr.refresh(function()
				for _, tool in ipairs(ensure) do
					local pkg = mr.get_package(tool)
					if not pkg:is_installed() then
						vim.notify("Installing " .. tool)
						pkg:install()
					end
				end
			end)
		end,
	},
}
