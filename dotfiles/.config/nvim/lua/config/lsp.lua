-- LSP list to enable
vim.lsp.enable({
	-- Lua
	"lua_ls",
	-- Bash
	"bash_ls",
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
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

-- Keymaps
-- Hover on buffer
vim.keymap.set("n", "<leader>lh", function()
	vim.lsp.buf.hover()
end, { desc = "Hover lsp" })

-- LSP rename functionality
vim.keymap.set("n", "<leader>lr", function()
	vim.lsp.buf.rename()
end, { desc = "Rename" })

-- Toggle virtual text with virtual lines
-- Modes: 1 = text only, 2 = lines only, 3 = off
local diag_mode = 2

vim.keymap.set("n", "<leader>tl", function()
	if diag_mode == 1 then
		vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
		vim.notify("Diagnostics: virtual text")
		diag_mode = 2
	elseif diag_mode == 2 then
		vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
		vim.notify("Diagnostics: virtual lines")
		diag_mode = 3
	else
		vim.diagnostic.config({ virtual_text = false, virtual_lines = false })
		vim.notify("Diagnostics: disabled")
		diag_mode = 1
	end
end, { desc = "Cycle diagnostic display mode" })
