vim.pack.add({
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/igorlfs/nvim-dap-view',
})

local map = vim.keymap.set

local dap = require('dap')
local widgets = require('dap.ui.widgets')

vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

map('n', '<Leader>dc', function()
  dap.continue()
end, { desc = 'dap continue' })

map('n', '<Leader>dso', function()
  dap.step_over()
end, { desc = 'dap step over' })

map('n', '<Leader>dsi', function()
  dap.step_into()
end, { desc = 'dap step into' })

map('n', '<Leader>dsO', function()
  dap.step_out()
end, { desc = 'dap step out' })

map('n', '<Leader>db', function()
  dap.toggle_breakpoint()
end, { desc = 'dap toggle breakpoint' })

map('n', '<Leader>dB', function()
  dap.set_breakpoint()
end, { desc = 'dap set breakpoint' })

map('n', '<Leader>dw', function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end, { desc = 'dep set breakpoint with log point message' })

map('n', '<Leader>dr', function()
  dap.repl.open()
end, { desc = 'dap repl' })

map('n', '<Leader>dl', function()
  dap.run_last()
end, { desc = 'dap run last' })

map({ 'n', 'x' }, '<Leader>dh', function()
  widgets.hover()
end, { desc = 'dap hover' })

map({ 'n', 'x' }, '<Leader>dp', function()
  widgets.preview()
end, { desc = 'dap preview' })

map('n', '<Leader>df', function()
  widgets.centered_float(widgets.frames)
end, { desc = 'dap frames' })

map('n', '<Leader>ds', function()
  widgets.centered_float(widgets.scopes)
end, { desc = 'dap scopes' })
