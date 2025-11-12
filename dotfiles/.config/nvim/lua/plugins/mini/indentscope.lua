return function()
	local indentscope = require("mini.indentscope")
	indentscope.setup({
		options = {
			try_as_border = true,
		},
		symbol = "│",
	})
end
