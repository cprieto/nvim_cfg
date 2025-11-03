return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  opts = {
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
          checkOnSave = diagnostics == 'rust-analyzer',
          diagnostics = {
            enable = diagnostics == 'rust-analyzer',
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
  },
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
  end
}
