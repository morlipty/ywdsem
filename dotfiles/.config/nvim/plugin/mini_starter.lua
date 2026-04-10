local header_art = [[
 ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
 │││├┤ │ │╰┐┌╯││││
 ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]]

local mini_starter = require('mini.starter')

mini_starter.setup({
  evaluate_single = true,
  items = {
    { name = 'Files', action = 'FzfLua files', section = 'FzfLua' },
    { name = 'Recent', action = 'FzfLua oldfiles', section = 'FzfLua' },
    mini_starter.sections.recent_files(10, true),
    mini_starter.sections.sessions(5, true),
    mini_starter.sections.builtin_actions(),
  },
  content_hooks = {
    mini_starter.gen_hook.adding_bullet('-> '),
    mini_starter.gen_hook.indexing('all', { 'Builtin actions', 'FzfLua' }),
    mini_starter.gen_hook.aligning('center', 'center'),
  },
  header = header_art,
  footer = '',
})
