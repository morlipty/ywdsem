return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			fps = 60,
			merge_duplicates = true,
			stages = "slide",
			render = "wrapped-compact",
			max_width = function()
				return math.min(40, vim.o.columns * 0.5)
			end,
			minimum_width = 30,
			timeout = 2000,
		})
		vim.notify = notify
	end,
}
