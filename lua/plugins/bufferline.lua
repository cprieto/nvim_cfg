return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      always_show_bufferline = false,
    }
  },
}
