return {
  'gbprod/nord.nvim',
  -- 'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require('nord').setup(opts)
    vim.cmd [[colorscheme nord]]
    -- vim.cmd [[colorscheme kanagawa]]
  end,
}
