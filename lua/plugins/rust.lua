return {
  "mrcjkb/rustaceanvim",
  lazy = false,
  init = function()
    ---@class vim.g
    vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, {
      server = {
        capabilities = {
          general = { positionEncodings = { 'utf-16' } },
        },
        default_settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = { enable = true },
            },
            files = {
              excludeDirs = {
                '.git', 'bin', '.venv', 'venv', 'target'
              }
            },
            procMacro = {
              enable = true,
              ignored = {
                ['async-trait'] = { 'async_trait' },
                ['async-recursion'] = { 'async_recursion' },
              }
            }
          }
        }
      }
    })
  end
}
