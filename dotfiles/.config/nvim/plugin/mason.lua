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
  local did_install = false
  local ensure = {
    -- lua
    'lua-language-server',
    'stylua',
    -- bash
    'bash-language-server',
    'shellcheck',
    'shfmt',
    -- fish
    'fish-lsp',
    -- python
    'ty',
    'ruff',
    -- markdown
    'marksman',
    -- oxfmt
    'oxfmt',
  }

  local registry = require('mason-registry')

  registry.refresh(function()
    for _, tool in ipairs(ensure) do
      local pkg = registry.get_package(tool)
      if not pkg:is_installed() then
        did_install = true
        vim.notify('Installing ' .. tool)
        pkg:install()
      end
    end

    if not did_install then
      vim.notify('All mason tools are already installed')
    end
  end)
end, {})
