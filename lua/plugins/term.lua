return {
  "akinsho/toggleterm.nvim",
  config = true,
  lazy = true,
  version = "*",
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Show terminal split" },
  }
}
