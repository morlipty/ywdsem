vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
})

local treesitter = require('nvim-treesitter')

treesitter.install({
  'python',
  'lua',
  'bash',
  'fish',
  'regex',
  'toml',
  'yaml',
  'markdown',
  'markdown_inline',
  'latex',
  'rust',
  'ron',
})

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(args)
    local name, kind = args.data.spec.name, args.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not args.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.cmd('TSUpdate')
    end
  end,
})
