return {
  "akinsho/bufferline.nvim",
  config = true,
  dependencies = {
    "famiu/bufdelete.nvim",
  },
  keys = {
    { "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Pick a buffer tab" },
  },
  opts = {
    options = {
      close_command = function(n) require("bufdelete").bufdelete(n, true) end,
      numbers = "ordinal",
      always_show_bufferline = true,
      diagnostics = "nvim_lsp",
      separator_style = "slant",
      offsets = {
        {
          filetype = "neo-tree",
          text = "File explorer",
        }
      }
    },
  },
  event = { "VimEnter" },
}
