return {
	"mikavilpas/yazi.nvim",

	event = "VeryLazy",

	config = function()
		local yazi = require("yazi")
		yazi.setup({
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		})
		vim.keymap.set("n", "<leader>ty", "<CMD>Yazi<CR>", { desc = "Toggle Yazi" })
	end,
}
