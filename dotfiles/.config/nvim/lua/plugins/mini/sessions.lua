return function()
	local sessions = require("mini.sessions")
	sessions.setup({})
	vim.keymap.set("n", "<leader>mn", function()
		local name = vim.fn.input("Session name: ")
		if name ~= "" then
			MiniSessions.write(name)
		else
			print("Session creation canceled")
		end
	end, { desc = "New session" })
  vim.keymap.set("n", "<leader>mr", function ()
    MiniSessions.select("read")
  end, {desc = "Read session"})
  vim.keymap.set("n", "<leader>mw", function ()
    MiniSessions.select("write")
  end, {desc = "Write session"})
  vim.keymap.set("n", "<leader>md", function ()
    MiniSessions.select("delete")
  end, {desc = "Delete session"})
end
