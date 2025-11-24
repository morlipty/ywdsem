return {
	"ibhagwan/fzf-lua",

	config = function()
		local fzflua = require("fzf-lua")
		fzflua.setup({
			"telescope",
			fzf_colors = true,
		})

		fzflua.register_ui_select()

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

		vim.keymap.set("n", "\\l", function()
			fzflua.live_grep()
		end, { desc = "Live grep search" })

		vim.keymap.set("n", "\\c", function()
			fzflua.grep_curbuf()
		end, { desc = "Current buf grep search" })

		vim.keymap.set("n", "\\s", function()
			fzflua.spell_suggest()
		end, { desc = "Spell suggest" })

		vim.keymap.set("n", "\\t", function()
			fzflua.grep({
				search = "TODO|FIXME|HACK|NOTE",
				cmd = "rg --color=always --smart-case -g '!{.git}/' -g '!mini/hipatterns.lua' -g '!fzf-lua.lua'",
				no_esc = true,
			})
		end, { desc = "Search for TODOS etc" })
	end,
}
