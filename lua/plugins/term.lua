return {
  "akinsho/toggleterm.nvim",
  config = true,
  version = "*",
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Show terminal split" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Show terminal split" },
  }
}
