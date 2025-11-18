return {
	"MagicDuck/grug-far.nvim",

	cmd = { "GrugFar", "GrugFarWithin" },
	event = "VeryLazy",

	config = function()
		local grug = require("grug-far")
		grug.setup({
			headerMaxWidth = 80,
		})

		vim.keymap.set("n", "<leader>sr", function()
			local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
			grug.open({
				transient = true,
				prefills = {
					filesFilter = ext and ext ~= "" and "*." .. ext or nil,
				},
			})
		end, { desc = "Search and Replace" })
	end,
}
