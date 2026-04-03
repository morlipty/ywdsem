vim.pack.add({ 'https://github.com/catgoose/nvim-colorizer.lua' })

local colorizer = require('colorizer')

colorizer.setup({
  options = {
    parsers = {
      rgb = {
        enable = true,
      },
    },
  },
  filetypes = {
    '*',
    '!help',
    '!mason',
    '!notify',
  },
})
