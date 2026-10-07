return {
  'arborist-ts/arborist.nvim',
  lazy = false,
  opts = {},
  keys = {
    { '<leader>cf', 'zM', desc = 'Fold all code' },
    { '<leader>cu', 'zR', desc = 'Unfold all code' },
  },
  init = function()
    vim.opt.foldlevelstart = 99
    vim.opt.foldlevel = 99
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  end,
}
