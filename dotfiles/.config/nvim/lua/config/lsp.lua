-- LSP list to enable
vim.lsp.enable({
	-- Lua
	"lua_ls",
	-- Bash
	"bashls",
	-- Python
	"basedpyright",
	"ruff",
	-- Spell
	"harper_ls",
	-- Markdown
	"marksman",
})

-- Diagnostics configuration
vim.diagnostic.config({
	virtual_lines = false,
	virtual_text = { spacing = 2, prefix = "●" },
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
})
