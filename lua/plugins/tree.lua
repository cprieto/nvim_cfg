return {
  "nvim-neo-tree/neo-tree.nvim",
  config = true,
  branch = "v3.x",
  keys = {
    { "<leader>ee", "<cmd>Neotree<cr>",        desc = "Show tree file" },
    { "<leader>er", "<cmd>Neotree reveal<cr>", desc = "Locate file in tree" },
  },
  opts = {
    close_if_last_window = true,
    buffers = {
      follow_current_file = {
        enabled = true,
      },
    }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  event = { "VimEnter" },
}
