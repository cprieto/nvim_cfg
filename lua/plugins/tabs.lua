return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  main = 'bufferline',
  opts = {
    options = {
      separator_style = 'thin',
      pick = {
        alphabet = '1234567890',
      },
      close_command = function(n) Snacks.bufdelete(n) end,
      right_mouse_command = function(n) Snacks.bufdelete(n) end,
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = 'snacks_layout_box',
          text = '󰙅  File Explorer',
          separator = true,
        },
      }
    },
  },
  keys = {
    { 'gt', '<cmd>BufferLineCycleNext<cr>', desc = "Next buffer" },
    { 'gT', '<cmd>BufferLineCyclePrev<cr>', desc = "Previous buffer" },
    { '<leader>bp', ':BufferLinePick<CR>', desc = "Pick opened buffer" },
  }
}
