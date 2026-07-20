local api = vim.api
local autocmd = api.nvim_create_autocmd

local function augroup(name)
  return api.nvim_create_augroup(name, { clear = true })
end

-- Highlight text on yank
autocmd('TextYankPost', {
  group = augroup('highlight_text_on_yank'),
  callback = function()
    vim.hl.on_yank({ timeout = 400 })
  end,
})

-- Enable Tree-sitter
autocmd('FileType', {
  group = augroup('treesitter'),
  callback = function(ev)
    if pcall(vim.treesitter.start, ev.buf) then
      vim.wo[0][0].foldmethod = 'expr'
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
  end,
})

-- Restore cursor position after reopening file
autocmd('BufReadPost', {
  group = augroup('restore_position'),
  callback = function(ev)
    local mark = api.nvim_buf_get_mark(ev.buf, '"')
    local line_count = api.nvim_buf_line_count(ev.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      api.nvim_feedkeys('g`"zvzz', 'n', true)
    end
  end,
})
