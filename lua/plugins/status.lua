return {
  "nvim-lualine/lualine.nvim",
  config = true,
  dependencies = {
    {
      "SmiteshP/nvim-navic",
      opts = {
        highlight = true,
      },
      config = true,
    },
  },
  opts = {
    options = {
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      disabled_filetypes = { 'TelescopePrompt' },
      theme = 'tokyonight',
    },
    extensions = {
      "neo-tree",
      "Lazy",
      "quickfix",
      "trouble",
    },
    winbar = {
      lualine_c = {
        "navic",
        navic_opts = nil,
      },
    },
  },
  event = { "VimEnter" },
}
