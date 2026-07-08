local api = vim.api

-- General function to create group names
local function augroup(name)
  return api.nvim_create_augroup(name, { clear = true })
end

-- Highlight text on yank
api.nvim_create_autocmd('TextYankPost', {
  group = augroup('highlight_text_on_yank'),
  callback = function()
    vim.hl.on_yank({ timeout = 400 })
  end,
})

-- Enable Tree-sitter
api.nvim_create_autocmd('FileType', {
  group = augroup('treesitter'),
  callback = function(ev)
    if pcall(vim.treesitter.start, ev.buf) then
      vim.wo[0][0].foldmethod = 'expr'
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
  end,
})
