return {
  'catppuccin/nvim',

  name = 'catppuccin',
  priority = 1000,

  config = function()
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
          StatusLine = { bg = colors.none },
          BlinkCmpMenuBorder = { bg = colors.none },
        }
      end,
      integrations = {
        fzf = true,
        mini = {
          enabled = true,
          indentscope_color = 'mauve',
        },
      },
    })

    vim.cmd.colorscheme('catppuccin-nvim')
  end,
}
