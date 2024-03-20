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
    sections = {
      lualine_a = {
        { "mode", separator = { left = "", }, right_padding = 2 },
      },
      lualine_z = {
        { "location", separator = { right = "" } },
      }
    },
    extensions = {
      "neo-tree",
      "Lazy",
      "quickfix",
      "trouble",
      "toggleterm",
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
