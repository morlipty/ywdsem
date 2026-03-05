return function()
	local bufremove = require("mini.bufremove")
	bufremove.setup({})
	vim.keymap.set("n", "<leader>mb", function()
		MiniBufremove.delete(0, false)
	end, { desc = "Buffer delete" })
end
