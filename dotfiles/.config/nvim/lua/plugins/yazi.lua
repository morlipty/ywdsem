return {
  'mikavilpas/yazi.nvim',

  event = 'VeryLazy',

  config = function()
    local yazi = require('yazi')
    yazi.setup({})
    vim.keymap.set('n', '<leader>y', function()
      yazi.yazi()
    end, { desc = 'Toggle Yazi' })
  end,
}
