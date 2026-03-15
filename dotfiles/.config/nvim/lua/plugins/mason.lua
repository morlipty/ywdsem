return {
  'mason-org/mason.nvim',

  config = function()
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
        -- Python
        'ty',
        'ruff',
        -- Lua
        'lua-language-server',
        'stylua',
        -- Bash
        'bash-language-server',
        'shellcheck',
        'shfmt',
        -- XML
        'xmlformatter',
        -- Markdown
        'marksman',
        -- Oxfmt
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
        vim.notify('Installing ' .. table.concat(installing, ', '))
      else
        vim.notify('All Mason tools are already installed')
      end
    end, {})
  end,
}
