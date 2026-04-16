vim.pack.add({ 'https://github.com/catppuccin/nvim' })

local catppuccin = require('catppuccin')

catppuccin.setup({
  flavour = 'mocha',
  dim_inactive = {
    enabled = true,
  },
  float = {
    transparent = true,
    solid = false,
  },
  custom_highlights = function(colors)
    return {
      BlinkCmpMenuBorder = { bg = colors.none },
    }
  end,
  integrations = {
    grug_far = true,
    mason = true,
    markview = true,
    mini = {
      indentscope_color = 'mauve',
    },
  },
})

vim.cmd.colorscheme('catppuccin-nvim')
