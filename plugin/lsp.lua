local lsp_dir = vim.fn.stdpath('config') .. '/lsp'
local servers = {}

for name, type in vim.fs.dir(lsp_dir) do
  if type == 'file' then
    local server = name:match('^(.+)%.lua$')
    if server then table.insert(servers, server) end
  end
end

vim.lsp.enable(servers)
