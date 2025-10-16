vim.keymap.set("n", "<leader>tv", function()
	vim.cmd.vsplit()
	vim.cmd.terminal()
	vim.cmd.startinsert()
end, { desc = "Open terminal (vertical split)" })

vim.keymap.set("n", "<leader>th", function()
	vim.cmd.split()
	vim.cmd.terminal()
	vim.cmd.startinsert()
end, { desc = "Open terminal (horizontal split)" })

vim.keymap.set("n", "<leader>tt", function()
	vim.cmd.terminal()
	vim.cmd.startinsert()
end, { desc = "Open terminal (horizontal split)" })

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})
