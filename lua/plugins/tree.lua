return {
  "nvim-neo-tree/neo-tree.nvim",
  config = true,
  branch = "v3.x",
  keys = {
    { "<leader>ee", "<cmd>Neotree<cr>", desc = "Show tree file" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  event = { "VimEnter" },
}
