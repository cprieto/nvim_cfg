local conditions = {
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
}

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
    sections = {
      lualine_b = {
        {
          'branch',
          icon = '',
          color = { gui = "bold" },
        },
        {
          'diff',
          symbols = { added = ' ', modified = ' ', removed = ' ' },
          cond = conditions.hide_in_width,
        }
      },
      lualine_c = {
        {
          'diagnostics',
          sources = { 'nvim_lsp', 'nvim_diagnostic' },
          symbols = { error = " ", warn = " ", info = " " },
        },
        {
          'filename',
          file_status = true,
          path = 1,
        },
        {
          'filetype',
          icon_only = true,
          colored = true,
          padding = 0,
        },
      },
      lualine_x = {
        {
          'lsp_status',
          icon = '',
          show_name = true,
        },
        {
          'fileformat',
        },
        {
          'encoding',
        },
        {
          'filesize',
        },
      }
    }
  }
}
