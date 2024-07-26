return {
  "petertriho/nvim-scrollbar",
  config = true,
  opts = {
    excluded_filetypes = {
      "cmp_docs",
      "cmp_menu",
      "dashboard",
      "noice",
      "prompt",
      "TelescopePrompt",
    }
  },
  event = { "BufReadPost", "BufNewFile" },
}
