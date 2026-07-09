vim.pack.add({
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/igorlfs/nvim-dap-view',
})

local vk = vim.keymap

local dap = require('dap')
local widgets = require('dap.ui.widgets')

vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

vk.set('n', '<Leader>dc', function()
  dap.continue()
end, { desc = 'dap continue' })

vk.set('n', '<Leader>dso', function()
  dap.step_over()
end, { desc = 'dap step over' })

vk.set('n', '<Leader>dsi', function()
  dap.step_into()
end, { desc = 'dap step into' })

vk.set('n', '<Leader>dsO', function()
  dap.step_out()
end, { desc = 'dap step out' })

vk.set('n', '<Leader>db', function()
  dap.toggle_breakpoint()
end, { desc = 'dap toggle breakpoint' })

vk.set('n', '<Leader>dB', function()
  dap.set_breakpoint()
end, { desc = 'dap set breakpoint' })

vk.set('n', '<Leader>dw', function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end, { desc = 'dep set breakpoint with log point message' })

vk.set('n', '<Leader>dr', function()
  dap.repl.open()
end, { desc = 'dap repl' })

vk.set('n', '<Leader>dl', function()
  dap.run_last()
end, { desc = 'dap run last' })

vk.set({ 'n', 'x' }, '<Leader>dh', function()
  widgets.hover()
end, { desc = 'dap hover' })

vk.set({ 'n', 'x' }, '<Leader>dp', function()
  widgets.preview()
end, { desc = 'dap preview' })

vk.set('n', '<Leader>df', function()
  widgets.centered_float(widgets.frames)
end, { desc = 'dap frames' })

vk.set('n', '<Leader>ds', function()
  widgets.centered_float(widgets.scopes)
end, { desc = 'dap scopes' })
