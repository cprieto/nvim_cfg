return {
  "ray-x/go.nvim",
  config = function()
    require('go').setup()
  end,
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  event = { "CmdlineEnter" },
  ft = { "go", "gomod", },
}
