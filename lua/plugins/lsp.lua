return {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = true,
    },
    "saghen/blink.cmp",
  },
  opts = {
    ensure_installed = { "rust_analyzer", "lua_ls", "clangd", "gopls" },
    handlers = {
      function(server_name)
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        require("lspconfig")[server_name].setup({
          capabilities = capabilities
        })
      end,
      ["rust_analyzer"] = function() end,
    }
  }
}
