return {
	"ibhagwan/fzf-lua",

	config = function()
		local fzflua = require("fzf-lua")
		fzflua.setup({
			"telescope",
			fzf_colors = true,
		})

		vim.keymap.set("n", "\\\\", function()
			fzflua.builtin()
		end, { desc = "Search" })

		vim.keymap.set("n", "\\b", function()
			fzflua.buffers()
		end, { desc = "Buffers" })

		vim.keymap.set("n", "\\f", function()
			fzflua.files()
		end, { desc = "Files" })

		vim.keymap.set("n", "\\d", function()
			fzflua.diagnostics_document()
		end, { desc = "Documents Diagnostics" })

		vim.keymap.set("n", "\\D", function()
			fzflua.diagnostics_workspace()
		end, { desc = "Workspace Diagnostics" })
	end,
}
