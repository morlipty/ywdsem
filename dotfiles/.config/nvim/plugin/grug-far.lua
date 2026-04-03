vim.pack.add({ 'https://github.com/MagicDuck/grug-far.nvim' })

local grug = require('grug-far')

grug.setup({
  showCompactInputs = true,
})

vim.keymap.set('n', '<leader>sr', function()
  grug.open()
end, { desc = 'Search and replace' })

vim.keymap.set({ 'n', 'x' }, '<leader>sw', function()
  grug.open({ visualSelectionUsage = 'operate-within-range' })
end, { desc = 'Search within range' })
