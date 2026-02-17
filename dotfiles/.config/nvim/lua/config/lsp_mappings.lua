local vk = vim.keymap

-- Hover on buffer
vk.set("n", "<leader>lh", function()
	vim.lsp.buf.hover()
end, { desc = "Hover lsp" })

-- Go to definition
vk.set("n", "<leader>lgd", function()
	vim.lsp.buf.definition()
end, { desc = "Go to definition" })

-- Go to references 
vk.set("n", "<leader>lgr", function()
	vim.lsp.buf.references()
end, { desc = "Go to references" })

-- Go to implementation
vk.set("n", "<leader>lgi", function()
	vim.lsp.buf.implementation()
end, { desc = "Go to implementation" })

-- Go to type definition 
vk.set("n", "<leader>lgt", function()
	vim.lsp.buf.type_definition()
end, { desc = "Go to type definition" })

-- Go to type declaration 
vk.set("n", "<leader>lgD", function()
	vim.lsp.buf.declaration()
end, { desc = "Go to type declaration" })

-- Codelens run
vk.set("n", "<leader>cr", function()
	vim.lsp.codelens.run()
end, { desc = "Codelens run" })

-- Codelens refresh 
vk.set("n", "<leader>cR", function()
	vim.lsp.codelens.refresh()
end, { desc = "Codelens refresh" })

-- LSP rename functionality
vk.set("n", "<leader>lr", function()
	vim.lsp.buf.rename()
end, { desc = "Rename" })

-- Toggle virtual text with virtual lines
-- Modes: 1 = text only, 2 = lines only, 3 = off
local diag_mode = 2

vk.set("n", "<leader>tl", function()
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
