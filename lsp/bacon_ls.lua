---@type vim.lsp.Config
return {
  cmd = { 'bacon-ls' },
  filetypes = { 'rust' },
  root_markers = { '.bacon-locations', 'Cargo.toml' },
  init_options = {},
  capabilities = {
      general = { positionEncodings = { 'utf-8' } },
  },
}
