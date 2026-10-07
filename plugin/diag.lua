---@type vim.diagnostic.Opts
local diag_opts = {
  underline = true,
  update_in_insert = false,
  virtual_text = false,
  virtual_lines = false,
  numhl = {
    [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
    [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
    [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
    [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
  },
  linehl = { [vim.diagnostic.severity.ERROR] = "ErrorMsg" },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
}

vim.diagnostic.config(diag_opts)
