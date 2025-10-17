---@type vim.lsp.Config
return {
	cmd = { "bash-language-server", "start" },
	settings = {
		bashIde = {
			shellcheckPath = "shellcheck",
			globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
		},
	},
	filetypes = {
		"bash",
		"sh",
	},
	root_markers = {
		".git",
	},
}
