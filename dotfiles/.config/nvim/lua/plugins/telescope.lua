return {
	"nvim-telescope/telescope.nvim",
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			extensions = {
				notify = {},
			},
		})

		telescope.load_extension("notify")

		local builtin = require("telescope.builtin")
		local notify = telescope.extensions.notify

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Files" })
		vim.keymap.set("n", "<leader>fn", notify.notify, { desc = "Telescope Notify" })
	end,
}
