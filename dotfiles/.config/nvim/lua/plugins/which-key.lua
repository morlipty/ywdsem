return {
  'folke/which-key.nvim',

  event = 'VeryLazy',

  config = function()
    local wk = require('which-key')
    wk.setup({
      preset = 'helix',
      replace = { ['<leader>'] = 'SPC' },
      show_help = false,
      triggers = {
        { '<auto>', mode = 'nixsotc' },
        { 's', mode = { 'n', 'x' } },
      },
    })
    vim.keymap.set('n', '<leader>?', function()
      wk.show({ global = false })
    end, { desc = 'Buffer Local Keymaps (which-key)' })
  end,
}
