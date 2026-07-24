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
map('n', '<leader><leader>', fzf.builtin, { desc = 'FzfLua' })
map('n', '<leader>fr', fzf.resume, { desc = 'Resume' })
map('n', '<leader>fb', fzf.buffers, { desc = 'Buffers' })
map('n', '<leader>fj', fzf.jumps, { desc = 'Jumps' })
map('n', '<leader>ff', fzf.files, { desc = 'Files' })
map('n', '<leader>fo', fzf.oldfiles, { desc = 'Oldfiles' })
map('n', '<leader>fl', fzf.live_grep, { desc = 'Live grep search' })
map('x', '<leader>fl', fzf.grep_visual, { desc = 'Live grep search' })
map('n', '<leader>fc', fzf.grep_curbuf, { desc = 'Current buf grep search' })
map('n', '<leader>fs', fzf.spell_suggest, { desc = 'Spell suggest' })
map('n', '<leader>fd', fzf.diagnostics_document, { desc = 'Documents Diagnostics' })
map('n', '<leader>fD', fzf.diagnostics_workspace, { desc = 'Workspace Diagnostics' })

-- Git
map('n', '<leader>gs', fzf.git_status, { desc = 'Git status' })
map('n', '<leader>gf', fzf.git_files, { desc = 'Git files' })
map('n', '<leader>gc', fzf.git_commits, { desc = 'Git commits' })
map('n', '<leader>gb', fzf.git_bcommits, { desc = 'Git bcommits' })

map('n', '<leader>ft', function()
  fzf.grep({
    search = '\\[(TODO|FIXME|HACK|NOTE)\\]',
    no_esc = true,
  })
end, { desc = 'Search for TODOS etc' })
