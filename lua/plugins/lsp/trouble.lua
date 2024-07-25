return {
  "folke/trouble.nvim",
  config = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    modes = {
      preview_float = {
        mode = "diagnostics",
        preview = {
          type = "float",
          relative = "editor",
          border = "rounded",
          title = "Preview",
          title_pos = "center",
          position = { 0, -2 },
          size = { width = 0.3, height = 0.3 },
          zindex = 200,
        },
      },
    },
  },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Show problems in local buffer" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Show problems in all buffers" },
    { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                   desc = "Show quickfix list" },
    { "<leader>ef", "<cmd>Trouble lsp toggle win.position=right<cr>",   desc = "Show file structure" }
  },
}
