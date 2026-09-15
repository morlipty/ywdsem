local mini_clue = require('mini.clue')

mini_clue.setup({
  window = {
    delay = 200,
  },
  triggers = {
    -- Leader triggers
    { mode = { 'n', 'x' }, keys = '<leader>' },

    -- `[` and `]` keys
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = { 'n', 'x' }, keys = 'g' },

    -- Marks
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = '`' },

    -- Registers
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = { 'n', 'x' }, keys = 'z' },

    -- `s` key
    { mode = { 'n', 'x' }, keys = 's' },
  },

  clues = {
    { mode = 'n', keys = '<leader>f', desc = '+FzfLua' },
    { mode = 'n', keys = '<leader>g', desc = '+Git' },
    { mode = 'n', keys = '<leader>m', desc = '+MINI' },
    { mode = 'n', keys = '<leader>t', desc = '+Toggle' },
    { mode = 'n', keys = '<leader>d', desc = '+DAP' },

    { mode = 'n', keys = '<leader>dn', postkeys = '<leader>d' },
    { mode = 'n', keys = '<leader>di', postkeys = '<leader>d' },
    { mode = 'n', keys = '<leader>do', postkeys = '<leader>d' },
    { mode = 'n', keys = '<leader>dN', postkeys = '<leader>d' },

    mini_clue.gen_clues.square_brackets(),
    mini_clue.gen_clues.builtin_completion(),
    mini_clue.gen_clues.g(),
    mini_clue.gen_clues.marks(),
    mini_clue.gen_clues.registers(),
    mini_clue.gen_clues.windows(),
    mini_clue.gen_clues.z(),
  },
})
