return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  keys = {
    { "<leader>xx", function() require("trouble").toggle() end, desc = "Show problems" },
  },
}
