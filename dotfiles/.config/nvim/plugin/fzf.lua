vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })

local map = vim.keymap.set

local fzf = require('fzf-lua')
local actions = fzf.actions

fzf.setup({
  fzf_opts = {
    ['--layout'] = 'default',
  },
  git = {
    status = {
      actions = {
        ['right'] = false,
        ['left'] = false,
        ['ctrl-h'] = { fn = actions.git_stage, reload = true },
        ['ctrl-l'] = { fn = actions.git_unstage, reload = true },
      },
    },
  },
  ui_select = {},
})

-- General
map('n', '\\\\', fzf.builtin, { desc = 'FzfLua' })
map('n', '\\b', fzf.buffers, { desc = 'Buffers' })
map('n', '\\j', fzf.jumps, { desc = 'Jumps' })
map('n', '\\f', fzf.files, { desc = 'Files' })
map('n', '\\o', fzf.oldfiles, { desc = 'Oldfiles' })
map('n', '\\l', fzf.live_grep, { desc = 'Live grep search' })
map('n', '\\c', fzf.grep_curbuf, { desc = 'Current buf grep search' })
map('n', '\\s', fzf.spell_suggest, { desc = 'Spell suggest' })
map('n', '\\d', fzf.diagnostics_document, { desc = 'Documents Diagnostics' })
map('n', '\\D', fzf.diagnostics_workspace, { desc = 'Workspace Diagnostics' })

-- Git
map('n', '\\gs', fzf.git_status, { desc = 'Git status' })
map('n', '\\gf', fzf.git_files, { desc = 'Git files' })
map('n', '\\gc', fzf.git_commits, { desc = 'Git commits' })
map('n', '\\gb', fzf.git_bcommits, { desc = 'Git bcommits' })

map('n', '\\t', function()
  fzf.grep({
    search = '\\[(TODO|FIXME|HACK|NOTE)\\]',
    no_esc = true,
  })
end, { desc = 'Search for TODOS etc' })
