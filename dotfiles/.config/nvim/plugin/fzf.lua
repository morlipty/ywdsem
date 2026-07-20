vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })

local map = vim.keymap.set

local fzf = require('fzf-lua')

fzf.setup({
  fzf_opts = {
    ['--layout'] = 'default',
  },
  ui_select = {},
})

map('n', '\\\\', function()
  fzf.builtin()
end, { desc = 'Search' })

map('n', '\\b', function()
  fzf.buffers()
end, { desc = 'Buffers' })

map('n', '\\f', function()
  fzf.files()
end, { desc = 'Files' })

map('n', '\\o', function()
  fzf.oldfiles()
end, { desc = 'Oldfiles' })

map('n', '\\d', function()
  fzf.diagnostics_document()
end, { desc = 'Documents Diagnostics' })

map('n', '\\D', function()
  fzf.diagnostics_workspace()
end, { desc = 'Workspace Diagnostics' })

map('n', '\\l', function()
  fzf.live_grep()
end, { desc = 'Live grep search' })

map('n', '\\c', function()
  fzf.grep_curbuf()
end, { desc = 'Current buf grep search' })

map('n', '\\s', function()
  fzf.spell_suggest()
end, { desc = 'Spell suggest' })

map('n', '\\t', function()
  fzf.grep({
    search = '\\[(TODO|FIXME|HACK|NOTE)\\]',
    no_esc = true,
  })
end, { desc = 'Search for TODOS etc' })
