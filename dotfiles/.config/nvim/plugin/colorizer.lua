vim.pack.add({ 'https://github.com/catgoose/nvim-colorizer.lua' })

local colorizer = require('colorizer')

colorizer.setup({
  lazy_load = true,
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
