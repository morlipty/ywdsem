local api = vim.api
local b = vim.b
local tconcat = table.concat
local fn_mode = vim.fn.mode

local function update_lsp_client_names(ev)
  local buf = ev.buf

  local clients = vim.lsp.get_clients({ bufnr = buf })

  local detaching_id = ev.event == 'LspDetach' and ev.data.client_id
  local names = {}

  for _, client in ipairs(clients) do
    if client.id ~= detaching_id then
      names[#names + 1] = client.name
    end
  end

  b[buf].lsp_client_names = #names > 0 and ' ' .. tconcat(names, ' ') or nil
end

api.nvim_create_autocmd({ 'LspAttach', 'LspDetach' }, { callback = update_lsp_client_names })

local function mode(name, hl)
  return string.format('%%#Stl%sInv#%%#Stl%s#%s%%#Stl%sInv#%%* ', hl, hl, name, hl)
end

local modes = setmetatable({
  ['n'] = mode('NORMAL', 'Normal'),
  ['v'] = mode('VISUAL', 'Visual'),
  ['V'] = mode('V-LINE', 'Visual'),
  ['\22'] = mode('V-BLCK', 'Visual'),
  ['s'] = mode('SELECT', 'Visual'),
  ['S'] = mode('S-LINE', 'Visual'),
  ['\19'] = mode('S-BLCK', 'Visual'),
  ['i'] = mode('INSERT', 'Insert'),
  ['R'] = mode('REPLCE', 'Replace'),
  ['c'] = mode('CMDLIN', 'Command'),
  ['r'] = mode('PROMPT', 'Command'),
  ['!'] = mode('  SH  ', 'Command'),
  ['t'] = mode(' TERM ', 'Terminal'),
}, {
  __index = function(t, k)
    t[k] = mode(k, 'Normal')
    return t[k]
  end,
})

function Statusline()
  return tconcat({
    modes[fn_mode()],
    b.minidiff_summary_string or '',
    '%=%<%F %r%m%h%=',
    vim.diagnostic.status(),
    b.lsp_client_names or '',
    ' %y',
  })
end

vim.o.statusline = '%{%v:lua.Statusline()%}'
