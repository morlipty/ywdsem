vim.pack.add({
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/igorlfs/nvim-dap-view',
})

local map = vim.keymap.set

local dap = require('dap')
local dap_view = require('dap-view')

vim.fn.sign_define('DapStopped', {
  text = ' ',
  texthl = 'DiagnosticWarn',
  linehl = 'DapStoppedLine',
  numhl = 'DapStoppedLine',
})

vim.fn.sign_define('DapBreakpoint', {
  text = ' ',
  texthl = 'DiagnosticInfo',
})

vim.fn.sign_define('DapBreakpointCondition', {
  text = ' ',
  texthl = 'DiagnosticInfo',
})

vim.fn.sign_define('DapBreakpointRejected', {
  text = ' ',
  texthl = 'DiagnosticError',
})

dap_view.setup({
  auto_toggle = true,
  winbar = {
    controls = {
      enabled = true,
    },
  },
  virtual_text = {
    enabled = true,
  },
})

map('n', '<leader>dv', dap_view.toggle, { desc = 'Toggle dap-view' })
map('n', '<leader>dt', dap_view.virtual_text_toggle, { desc = 'Toggle virtual text' })
map('n', '<leader>dh', dap_view.hover, { desc = 'Hover' })
map('n', '<leader>dw', dap_view.add_expr, { desc = 'watch' })

map('n', '<leader>dc', dap.continue, { desc = 'Continue' })
map('n', '<leader>dl', dap.run_last, { desc = 'Run last' })
map('n', '<leader>dt', dap.terminate, { desc = 'Terminate' })
map('n', '<leader>dd', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
map('n', '<leader>db', function()
  dap.set_breakpoint(vim.fn.input('Condition: '))
end, { desc = 'Conditional breakpoint' })

map('n', '<leader>dn', dap.step_over, { desc = 'Step over' })
map('n', '<leader>di', dap.step_into, { desc = 'Step into' })
map('n', '<leader>do', dap.step_out, { desc = 'Step out' })
map('n', '<leader>dN', dap.step_back, { desc = 'Step back' })
map('n', '<leader>dr', dap.repl.open, { desc = 'REPL' })
