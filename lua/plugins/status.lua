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
    {
      "letieu/harpoon-lualine",
    }
  },
  opts = {
    options = {
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      disabled_filetypes = { 'TelescopePrompt' },
      theme = 'catppuccin',
    },
    extensions = {
      "neo-tree",
      "Lazy",
      "quickfix",
      "trouble",
      "toggleterm",
    },
    sections = {
      lualine_c = {
        "filename",
        "harpoon2",
      }
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
