return {
	"ibhagwan/fzf-lua",

	config = function()
		local fzflua = require("fzf-lua")
		fzflua.setup({
			"telescope",
			fzf_colors = true,
		})

		vim.keymap.set("n", "<leader>ff", function()
			fzflua.builtin()
		end, { desc = "Search" })

		vim.keymap.set("n", "<leader>fb", function()
			fzflua.buffers()
		end, { desc = "Buffers" })

		vim.keymap.set("n", "<leader>fd", function()
			fzflua.diagnostics_document()
		end, { desc = "Documents Diagnostics" })

		vim.keymap.set("n", "<leader>fD", function()
			fzflua.diagnostics_workspace()
		end, { desc = "Workspace Diagnostics" })
	end,
}
