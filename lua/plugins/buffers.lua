return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    options = {
      close_command = function(n) Snacks.bufdelete(n) end,
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "snacks_layout_box",
        },
      }
    }
  },
  keys = {
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete current buffer" },
  }
}
