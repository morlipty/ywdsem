return {
	"rcarriga/nvim-notify",
	config = function()
		local async = require("plenary.async")
		vim.notify = require("notify").async
	end,
}
