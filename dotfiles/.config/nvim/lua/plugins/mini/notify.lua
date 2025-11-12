return function()
	local notify = require("mini.notify")
	notify.setup({
		window = {
			winblend = 0,
			max_width_share = 0.25,
			config = { border = "rounded" },
		},
	})
  vim.keymap.set("n","<leader>mh",function ()
    MiniNotify.show_history()
  end, {desc = "Notifications history"})
end
