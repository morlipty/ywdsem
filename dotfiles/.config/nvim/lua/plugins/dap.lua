return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},

	config = function()
		vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({})
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close({})
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close({})
		end

		dap.configurations = {
			python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = function()
						local cwd = vim.fn.getcwd()
						if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
							return cwd .. "/venv/bin/python"
						elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
							return cwd .. "/.venv/bin/python"
						else
							return "/usr/bin/python"
						end
					end,
				},
			},

			vim.keymap.set("n", "<leader>du", function()
				dapui.toggle({})
			end, { desc = "Dap Ui" }),

			vim.keymap.set({ "n", "x" }, "<leader>de", function()
				dapui.eval()
			end, { desc = "Dap Eval" }),

			vim.keymap.set("n", "<leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "Toggle breakpoint" }),

			vim.keymap.set("n", "<leader>dc", function()
				dap.continue()
			end, { desc = "Continue" }),

			vim.keymap.set("n", "<leader>dC", function()
				dap.run_to_cursor()
			end, { desc = "Run to cursor" }),

			vim.keymap.set("n", "<leader>dt", function()
				dap.terminate()
			end, { desc = "Terminate" }),

			vim.keymap.set("n", "<leader>dj", function()
				dap.down()
			end, { desc = "Down" }),

			vim.keymap.set("n", "<leader>dk", function()
				dap.Up()
			end, { desc = "Up" }),

			vim.keymap.set("n", "<leader>dg", function()
				dap.goto_()
			end, { desc = "Go to Line (No Execute)" }),

			vim.keymap.set("n", "<leader>di", function()
				dap.step_into()
			end, { desc = "Step Into" }),

			vim.keymap.set("n", "<leader>dO", function()
				dap.step_over()
			end, { desc = "Step Over" }),

			vim.keymap.set("n", "<leader>do", function()
				dap.step_out()
			end, { desc = "Step Out" }),
		}
	end,
}
