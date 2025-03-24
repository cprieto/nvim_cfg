return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    options = {
      close_command = function(n) Snacks.bufdelete(n) end,
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "snacks_layout_box",
        },
      }
    }
  },
  config = function(_, opts)
    local setup = require('bufferline').setup
    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
      callback = function()
        vim.schedule(function()
          pcall(setup, opts)
        end)
      end,
    })
  end,
}
