return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim",
      lazy = true,
      config = true,
      cmd = "Mason",
    },
  },
}
