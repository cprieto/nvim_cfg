return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>b", group = "Buffers" },
      { "<leader>c", group = "Code", mode = { "n", "x" } },
      { "<leader>d", group = "Debug", mode = { "n", "x" } },
      { "<leader>T", group = "Tests" },
      { "<leader>f", group = "Files" },
      { "<leader>g", group = "Go to" },
      { "<leader>l", group = "Git" },
      { "<leader>m", group = "Marks" },
      { "<leader>s", group = "Search" },
      { "<leader>t", group = "Terminal" },
      { "<leader>u", group = "UI" },
    },
  }
}
