return {
  "nvimdev/dashboard-nvim",
  config = true,
  opts = {
    theme = "hyper",
    config = {
      week_header = {
        enable = true,
      },
    },
  },
  event = { "VimEnter" },
}
