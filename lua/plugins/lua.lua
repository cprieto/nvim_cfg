return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      { path = "snacks.nvim",        words = { "Snacks" }, },
      { path = "mini.icons",         words = { "MiniIcon" }, },
      { path = "${3rd}/luv/library", words = { "vim%.uv" }, },
    },
  }
}
