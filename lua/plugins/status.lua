return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "SmiteshP/nvim-navic",
      opts = {
        lsp = { auto_attach = true },
      },
    },
  },
  opts = {
    options = {
      theme = 'auto',
      disabled_filetypes = { 'dashboard', 'snacks_dashboard', },
      ignored_filetypes = { 'snacks_picker_preview', },
      ignored_buftypes = { 'nofile', 'terminal', },
      section_separators = { left = '', right = '' },
      component_separators = '',
      -- section_separators = { left = '', right = '' },
    },
    extensions = { 'quickfix', 'lazy', 'fzf', 'aerial', },
  }
}
