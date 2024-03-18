return {
  "nvim-tree/nvim-tree.lua",
  config = true,
  keys = {
    { "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "Show/hide file tree" },
  },
  opts = {
    filters = {
      custom = { "^.git$" },
    },
  },
}
