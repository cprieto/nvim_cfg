return {
  "echasnovski/mini.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "lewis6991/gitsigns.nvim",
      config = true,
    },
    "nvim-tree/nvim-web-devicons",
  },
  version = "*",
  config = function()
    require("mini.cursorword").setup()
    require("mini.statusline").setup()
    require("mini.tabline").setup()
  end,
}
