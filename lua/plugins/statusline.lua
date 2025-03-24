return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "bwpge/lualine-pretty-path",
  },
  opts = {
    options = {
      --theme = bubbles_theme,
      theme = "catppuccin",
      component_separators = '',
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        "snacks_layout_box",
      },
    },
    sections = {
      lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
      lualine_b = { 'branch' },
      lualine_c = {
        "fileformat",
        "encoding",
        "diagnostics",
        { "pretty_path" },
      },
      lualine_x = {},
      lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 2 } },
      },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
  },
}
