return function()
  local mini_clue = require('mini.clue')
  mini_clue.setup({
    window = {
      delay = 200,
    },
    triggers = {
      -- Leader triggers
      { mode = { 'n', 'x' }, keys = '<Leader>' },

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

      -- fzf-lua
      { mode = { 'i', 'n' }, keys = '\\' },
    },

    clues = {
      mini_clue.gen_clues.square_brackets(),
      mini_clue.gen_clues.builtin_completion(),
      mini_clue.gen_clues.g(),
      mini_clue.gen_clues.marks(),
      mini_clue.gen_clues.registers(),
      mini_clue.gen_clues.windows(),
      mini_clue.gen_clues.z(),
    },
  })
end
