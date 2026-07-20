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
end, { desc = 'Continue' })

map('n', '<Leader>dso', function()
  dap.step_over()
end, { desc = 'Step over' })

map('n', '<Leader>dsi', function()
  dap.step_into()
end, { desc = 'Step into' })

map('n', '<Leader>dsO', function()
  dap.step_out()
end, { desc = 'Step out' })

map('n', '<Leader>db', function()
  dap.toggle_breakpoint()
end, { desc = 'Toggle breakpoint' })

map('n', '<Leader>dB', function()
  dap.set_breakpoint()
end, { desc = 'Set breakpoint' })

map('n', '<Leader>dw', function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end, { desc = 'Set breakpoint with log point message' })

map('n', '<Leader>dr', function()
  dap.repl.open()
end, { desc = 'REPL' })

map('n', '<Leader>dl', function()
  dap.run_last()
end, { desc = 'Run last' })

map({ 'n', 'x' }, '<Leader>dh', function()
  widgets.hover()
end, { desc = 'Hover' })

map({ 'n', 'x' }, '<Leader>dp', function()
  widgets.preview()
end, { desc = 'Preview' })

map('n', '<Leader>df', function()
  widgets.centered_float(widgets.frames)
end, { desc = 'Frames' })

map('n', '<Leader>ds', function()
  widgets.centered_float(widgets.scopes)
end, { desc = 'Scopes' })
