return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = true,
    }
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    require('which-key').setup()
  end,
}
