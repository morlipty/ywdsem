return {
  'MagicDuck/grug-far.nvim',

  config = function()
    local grug = require('grug-far')
    grug.setup({
      showCompactInputs = true,
    })

    vim.keymap.set('n', '<leader>sr', function()
      grug.open({})
    end, { desc = 'Search and Replace' })

    vim.keymap.set({ 'n', 'x' }, '<leader>si', function()
      grug.open({ visualSelectionUsage = 'operate-within-range' })
    end, { desc = 'grug-far: Search within range' })
  end,
}
