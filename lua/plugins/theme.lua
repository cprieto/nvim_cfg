return {
  'rashedInt32/tidepool.nvim',
  -- 'WTFox/luna.nvim',
  -- 'scottmckendry/cyberdream.nvim',
  --'gbprod/nord.nvim',
  -- 'rebelot/kanagawa.nvim',
  -- 'olimorris/onedarkpro.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    -- require('luna').setup(opts)
    -- vim.cmd.colorscheme('luna')
    -- require('nord').setup(opts)
    require('tidepool').setup(opts)
    -- vim.cmd [[colorscheme nord]]
    -- vim.cmd [[colorscheme kanagawa]]
    -- vim.cmd [[colorscheme onedark]]
    vim.cmd [[colorscheme tidepool]]
  end,
}
