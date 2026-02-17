return function()
	local indentscope = require("mini.indentscope")
	indentscope.setup({
		options = {
			try_as_border = true,
		},
		symbol = "│",
	})

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
end
