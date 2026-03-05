return {
	"igorlfs/nvim-dap-view",

	config = function()
		local dap_view = require("dap-view")
		dap_view.setup({
			winbar = {
				controls = {
					enabled = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>dv", function()
			dap_view.toggle()
		end, { desc = "dap view toggle" })
	end,
}
