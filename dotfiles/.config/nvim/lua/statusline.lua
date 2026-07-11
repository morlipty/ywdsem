local api = vim.api
local b = vim.b

local update_lsp_client_names = function(ev)
  local buf = ev.buf

  local clients = vim.lsp.get_clients({ bufnr = buf })

  local detaching_id = ev.event == 'LspDetach' and ev.data.client_id
  local names = {}

  for _, client in ipairs(clients) do
    if client.id ~= detaching_id then
      names[#names + 1] = client.name
    end
  end

  b[buf].lsp_client_names = #names > 0 and ' ' .. table.concat(names, ' ') or nil
end

api.nvim_create_autocmd({ 'LspAttach', 'LspDetach' }, { callback = update_lsp_client_names })

-- stylua: ignore start
local function mode(name, hl)
  return table.concat({
    '%#Stl', hl, 'Inv#',
    '%#Stl', hl, '#', name,
    '%#Stl', hl, 'Inv#%* ',
    })
end
local modes = {
  ['n']   = mode('NORMAL', 'Normal'),
  ['v']   = mode('VISUAL', 'Visual'),
  ['V']   = mode('V-LINE', 'Visual'),
  ['\22'] = mode('V-BLCK', 'Visual'),
  ['s']   = mode('SELECT', 'Visual'),
  ['S']   = mode('S-LINE', 'Visual'),
  ['\19'] = mode('S-BLCK', 'Visual'),
  ['i']   = mode('INSERT', 'Insert'),
  ['R']   = mode('REPLCE', 'Replace'),
  ['c']   = mode('CMDLIN', 'Command'),
  ['r']   = mode('PROMPT', 'Command'),
  ['!']   = mode('  SH  ', 'Command'),
  ['t']   = mode(' TERM ', 'Terminal'),
}
-- stylua: ignore end

function Statusline()
  local m = api.nvim_get_mode().mode

  return table.concat({
    modes[m] or m,
    b.minidiff_summary_string or '',
    '%=%<%F %r%m%h%=',
    vim.diagnostic.status(),
    b.lsp_client_names or '',
    ' %y',
  })
end

vim.o.statusline = '%{%v:lua.Statusline()%}'
