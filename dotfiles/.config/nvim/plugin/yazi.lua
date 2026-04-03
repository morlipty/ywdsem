vim.pack.add({
  'https://github.com/mikavilpas/yazi.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
})

local yazi = require('yazi')

vim.keymap.set('n', '<leader>y', function()
  yazi.yazi()
end, { desc = 'Yazi' })
