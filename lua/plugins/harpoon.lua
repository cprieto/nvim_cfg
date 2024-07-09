return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  event = "VeryLazy",
  config = true,
  keys = {
    {
      "<leader>ha",
      function()
        local harpoon = require('harpoon')
        harpoon:list():add()
      end,
      desc = "Add harpoon"
    },
    {
      "<leader>hl",
      function()
        local harpoon = require('harpoon')
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "List harpoons"
    },
    {
      "<leader>hn",
      function()
        local harpoon = require('harpoon')
        harpoon:list():next()
      end,
      desc = "Next harpoon"
    },
    {
      "<leader>hp",
      function()
        local harpoon = require('harpoon')
        harpoon:list():prev()
      end,
      desc = "Next harpoon"
    },
  }
}
