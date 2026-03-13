return function()
  local mini_bufremove = require('mini.bufremove')
  mini_bufremove.setup({})
  vim.keymap.set('n', '<leader>mb', function()
    MiniBufremove.delete(0, false)
  end, { desc = 'Buffer delete' })
end
