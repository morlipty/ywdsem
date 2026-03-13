return function()
  local header_art = [[
 ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
 │││├┤ │ │╰┐┌╯││││
 ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]]
  local mini_starter = require('mini.starter')
  mini_starter.setup({
    content_hooks = {
      mini_starter.gen_hook.adding_bullet('-> '),
      mini_starter.gen_hook.aligning('center', 'center'),
    },
    header = header_art,
    footer = '',
  })
end
