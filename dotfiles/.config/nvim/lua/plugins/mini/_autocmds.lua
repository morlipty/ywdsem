return function()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = {
			"fzf",
			"help",
			"lazy",
			"mason",
			"notify",
		},
		callback = function()
			vim.b.miniindentscope_disable = true
		end,
	})

	local g = vim.api.nvim_create_augroup("MiniNotifyTransparent", { clear = true })
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = g,
		callback = function()
			vim.api.nvim_set_hl(0, "MiniNotifyNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "MiniNotifyBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "MiniNotifyTitle", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		end,
	})
end
