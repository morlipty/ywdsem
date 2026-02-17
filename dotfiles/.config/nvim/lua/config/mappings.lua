local vk = vim.keymap

-- Center screen on jumps
vk.set("n", "<C-d>", "<C-d>zz")
vk.set("n", "<C-u>", "<C-u>zz")
vk.set("n", "G", "Gzz")

-- Better movement in insert mode
vk.set("i", "<C-b>", "<Esc>^i")
vk.set("i", "<C-e>", "<End>")
vk.set("i", "<C-h>", "<Left>")
vk.set("i", "<C-l>", "<Right>")
vk.set("i", "<C-j>", "<Down>")
vk.set("i", "<C-k>", "<Up>")

-- Window movement
vk.set("n", "<C-h>", "<C-w><C-h>")
vk.set("n", "<C-l>", "<C-w><C-l>")
vk.set("n", "<C-j>", "<C-w><C-j>")
vk.set("n", "<C-k>", "<C-w><C-k>")

-- Clear highlighting
vk.set("n", "<Esc>", "<cmd>noh<CR>")

-- Toggle wrapping
vk.set("n", "<leader>tw", "<cmd>set nowrap!<CR>", { desc = "Toggle nowrap" })

-- Toggle q key behavior(reverse to :q)
local q_enabled = false
vk.set("n", "q", "<Nop>")

vk.set("n", "<leader>tq", function()
	if q_enabled then
		vk.set("n", "q", "<Nop>")
		vim.notify("q disabled")
		q_enabled = false
	else
		vk.del("n", "q")
		vim.notify("q enabled")
		q_enabled = true
	end
end, { desc = "Toggle q command" })
