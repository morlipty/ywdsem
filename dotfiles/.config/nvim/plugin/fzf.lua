vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })

local map = vim.keymap.set

local fzflua = require('fzf-lua')

fzflua.setup({
  fzf_colors = true,
  fzf_opts = {
    ['--layout'] = 'default',
  },
  ui_select = {},
})

map('n', '\\\\', function()
  fzflua.builtin()
end, { desc = 'Search' })

map('n', '\\b', function()
  fzflua.buffers()
end, { desc = 'Buffers' })

map('n', '\\f', function()
  fzflua.files()
end, { desc = 'Files' })

map('n', '\\d', function()
  fzflua.diagnostics_document()
end, { desc = 'Documents Diagnostics' })

map('n', '\\D', function()
  fzflua.diagnostics_workspace()
end, { desc = 'Workspace Diagnostics' })

map('n', '\\l', function()
  fzflua.live_grep()
end, { desc = 'Live grep search' })

map('n', '\\c', function()
  fzflua.grep_curbuf()
end, { desc = 'Current buf grep search' })

map('n', '\\s', function()
  fzflua.spell_suggest()
end, { desc = 'Spell suggest' })

map('n', '\\t', function()
  fzflua.grep({
    search = '\\[(TODO|FIXME|HACK|NOTE)\\]',
    cmd = 'rg --color=always --smart-case',
    no_esc = true,
  })
end, { desc = 'Search for TODOS etc' })
