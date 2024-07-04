return {
  "folke/trouble.nvim",
  config = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  keys = {
    { "<leader>xx", function() require("trouble").toggle() end, desc = "Show problems" },
  },
}
