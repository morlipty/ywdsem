vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
})

local treesitter = require('nvim-treesitter')

treesitter.install({
  'python',
  'lua',
  'bash',
  'fish',
  'regex',
  'toml',
  'yaml',
  'markdown',
  'markdown_inline',
  'latex',
  'rust',
  'ron',
})
