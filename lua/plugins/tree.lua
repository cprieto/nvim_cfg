return {
  "nvim-neo-tree/neo-tree.nvim",
  config = true,
  branch = "v3.x",
  keys = {
    { "<leader>ee", "<cmd>Neotree<cr>", desc = "Show tree file" },
  },
  opts = {
    close_if_last_window = true,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  event = { "VimEnter" },
}
