return {
  "akinsho/toggleterm.nvim",
  config = true,
  lazy = true,
  version = "*",
  keys = {
    { "<C-t>", "<cmd>ToggleTerm direction=float<cr>", desc = "Show terminal split" },
  }
}
