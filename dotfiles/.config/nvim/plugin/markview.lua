vim.pack.add({ 'https://github.com/OXY2DEV/markview.nvim' })

---@diagnostic disable: missing-fields

local markview = require('markview')
local presets = require('markview.presets')
local checkboxes = require('markview.extras.checkboxes')

checkboxes.setup()

markview.setup({
  preview = {
    modes = { 'n', 'no', 'c' },
    hybrid_modes = { 'n', 'no', 'c' },
  },

  markdown = {
    headings = presets.headings.glow,
    tables = presets.tables.rounded,
    horizontal_rules = presets.horizontal_rules.thick,
    block_quotes = presets.block_quotes.obsidian,
  },
})
