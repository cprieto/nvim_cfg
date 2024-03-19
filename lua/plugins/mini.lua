local components = {
  "cursorword", "pairs", "comment",
}

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
    for _, comp in ipairs(components) do
      require("mini." .. comp).setup()
    end
  end,
}
