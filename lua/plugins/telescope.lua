return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  opts = {
    defaults = {
      initial_mode = "normal",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          anchor = "S",
          prompt_position = "top",
        },
        vertical = {
          mirror = false,
        },
      },
      extensions = {
        file_browser = {
          hijack_netrw = true
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "gmake",
    },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Opened buffers" },
    { "<leader>nl", "<cmd>Telescope noice<cr>", desc = "View notifications" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  },
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("file_browser")
    telescope.load_extension("noice")
    telescope.load_extension("fzf")
  end,
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argv(0) == '' then
          require("telescope").extensions.file_browser.file_browser()
        end
      end,
    })
  end,
}
