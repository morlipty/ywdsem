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
  custom_highlights = function(c)
    return {
      BlinkCmpMenuBorder = { bg = c.none },

      -- Normal
      StlNormal = { bg = c.blue, fg = c.mantle, bold = true },
      StlNormalInv = { fg = c.blue, bg = c.none },
      -- Insert
      StlInsert = { fg = c.base, bg = c.green, bold = true },
      StlInsertInv = { fg = c.green, bg = c.none },
      -- Terminal
      StlTerminal = { fg = c.base, bg = c.green, bold = true },
      StlTerminalInv = { fg = c.green, bg = c.none },
      -- Command
      StlCommand = { fg = c.base, bg = c.peach, bold = true },
      StlCommandInv = { fg = c.peach, bg = c.none },
      -- Visual
      StlVisual = { fg = c.base, bg = c.mauve, bold = true },
      StlVisualInv = { fg = c.mauve, bg = c.none },
      -- Replace
      StlReplace = { fg = c.base, bg = c.red, bold = true },
      StlReplaceInv = { fg = c.red, bg = c.none },
      -- Inactive
      StlInactive = { fg = c.surface1, bg = c.none, bold = true },
      StlInactiveInv = { fg = c.surface1, bg = c.none },
    }
  end,
  integrations = {
    mason = true,
    markview = true,
    mini = {
      indentscope_color = 'mauve',
    },
  },
})

vim.cmd.colorscheme('catppuccin-nvim')
