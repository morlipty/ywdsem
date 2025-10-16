return {
	"ibhagwan/fzf-lua",
	config = function()
		local fzflua = require("fzf-lua")

		vim.keymap.set("n", "<leader>ff", function()
			fzflua.builtin()
		end, { desc = "Search" })

		vim.keymap.set("n", "<leader>ft", function()
			fzflua.grep_project({
				search = "TODO",
				rg_opts = [[--column --line-number --no-heading --color=always --smart-case --hidden -g '!.git' -g '!fzf-lua.lua']],
			})
		end, { desc = "Search TODO" })
	end,
}
