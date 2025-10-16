---@type vim.lsp.Config
return {
	cmd = {
		"pyright",
	},
	filetypes = {
		"python",
	},
	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}
