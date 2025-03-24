return {
  "catppuccin/nvim",
  priority = 1000,
  lazy = false,
  opts = {
    integrations = {
      blink_cmp = true,
      mason = true,
      noice = true,
      snacks = {
        enabled = true,
      }
    },
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd [[colorscheme catppuccin-mocha]]
  end,
}
