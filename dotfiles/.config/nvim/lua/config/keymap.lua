local map = vim.keymap.set

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

local q_enabled = false
map("n", "q", "<Nop>")

vim.keymap.set("n", "<leader>q", function()
	if q_enabled then
		map("n", "q", "<Nop>")
		print("q disabled")
		q_enabled = false
	else
		vim.keymap.del("n", "q")
		print("q enabled (macros & cmdline window active)")
		q_enabled = true
	end
end, { desc = "Toggle q command" })
