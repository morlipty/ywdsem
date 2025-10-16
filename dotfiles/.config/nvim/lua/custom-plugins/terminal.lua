local M = {}

function M.hello_world()
	print("hello_world")
end

vim.api.nvim_command('command! HelloWorld lua require("terminal").hello_world()')

return M
