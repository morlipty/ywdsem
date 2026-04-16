vim.pack.add({
  'https://github.com/mikavilpas/yazi.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
})

local yazi = require('yazi')

yazi.setup({
  keymaps = {
    open_and_pick_window = false,
  },
  integrations = {
    grep_in_directory = 'fzf-lua',
    grep_in_selected_files = 'fzf-lua',
  },
})

vim.keymap.set('n', '<leader>;', function()
  yazi.toggle()
end, { desc = 'Yazi' })
