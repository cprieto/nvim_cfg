return {
  "echasnovski/mini.nvim",
  event = { "BufReadPost", "BufNewFile" },
  version = "*",
  config = function()
    require("mini.cursorword").setup()
  end,
}
