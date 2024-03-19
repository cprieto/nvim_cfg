return {
  "nvim-neo-tree/neo-tree.nvim",
  config = true,
  branch = "v3.x",
  keys = {
    { "<leader>ee", "<cmd>Neotree<cr>", desc = "Show tree file" },
  },
  opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    close_if_last_window = true,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  event = { "VimEnter" },
}
