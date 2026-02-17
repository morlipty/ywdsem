return {
	{
		"mfussenegger/nvim-dap-python",

		config = function()
			local dap_python = require("dap-python")
			dap_python.setup("python3")
		end,
	},

	{
		"mfussenegger/nvim-dap",

		config = function()
			local dap = require("dap")
			local widgets = require("dap.ui.widgets")

			vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end, { desc = "dap continue" })

			vim.keymap.set("n", "<F10>", function()
				dap.step_over()
			end, { desc = "dap step over" })

			vim.keymap.set("n", "<F11>", function()
				dap.step_into()
			end, { desc = "dap step into" })

			vim.keymap.set("n", "<F12>", function()
				dap.step_out()
			end, { desc = "dap step out" })

			vim.keymap.set("n", "<Leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "dap toggle breakpoint" })

			vim.keymap.set("n", "<Leader>dB", function()
				dap.set_breakpoint()
			end, { desc = "dap set breakpoint" })

			vim.keymap.set("n", "<Leader>dw", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, { desc = "dep set breakpoint with log point message" })

			vim.keymap.set("n", "<Leader>dr", function()
				dap.repl.open()
			end, { desc = "dap repl" })

			vim.keymap.set("n", "<Leader>dl", function()
				dap.run_last()
			end, { desc = "dap run last" })

			vim.keymap.set({ "n", "x" }, "<Leader>dh", function()
				widgets.hover()
			end, { desc = "dap hover" })

			vim.keymap.set({ "n", "x" }, "<Leader>dp", function()
				widgets.preview()
			end, { desc = "dap preview" })

			vim.keymap.set("n", "<Leader>df", function()
				widgets.centered_float(widgets.frames)
			end, { desc = "dap frames" })

			vim.keymap.set("n", "<Leader>ds", function()
				widgets.centered_float(widgets.scopes)
			end, { desc = "dap scopes" })
		end,
	},
}
