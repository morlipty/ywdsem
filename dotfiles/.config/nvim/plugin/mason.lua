vim.pack.add({ 'https://github.com/mason-org/mason.nvim' })

local mason = require('mason')

mason.setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
})

vim.api.nvim_create_user_command('MasonInstallAll', function()
  local installing = {}
  local ensure = {
    -- python
    'ty',
    'ruff',
    -- lua
    'lua-language-server',
    'stylua',
    -- bash
    'bash-language-server',
    'shellcheck',
    'shfmt',
    -- xml
    'xmlformatter',
    -- markdown
    'marksman',
    -- oxfmt
    'oxfmt',
  }

  local mr = require('mason-registry')

  mr.refresh(function()
    for _, tool in ipairs(ensure) do
      local pkg = mr.get_package(tool)
      if not pkg:is_installed() then
        table.insert(installing, tool)
        pkg:install()
      end
    end
  end)

  if #installing > 0 then
    vim.notify('installing ' .. table.concat(installing, ', '))
  else
    vim.notify('all mason tools are already installed')
  end
end, {})
