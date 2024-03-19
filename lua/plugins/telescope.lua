local function buffers()
  require("telescope.builtin").buffers({
    sort_mru = true,
  })
end

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  opts = {
    extensions = {
      "file_browser",
      "noice",
      "fzf",
    },
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
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = function()
        local os = vim.loop.os_uname().sysname
        if os == 'Windows_NT' then
          vim.fn.system({
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release",
            "cmake --build build --config Release",
            "cmake --install build --prefix build",
          })
        elseif os == 'FreeBSD' then
          vim.fn.system({ "gmake" })
        else
          vim.fn.system({ "make" })
        end
      end,
    },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",   desc = "Find files" },
    { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",     desc = "Recent files" },
    { "<leader>fb", buffers,                           desc = "Opened buffers" },
    { "<leader>nl", "<cmd>Telescope noice<cr>",        desc = "View notifications" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",    desc = "Live grep" },
    { "<leader>fc", "<cmd>Telescope frecency<cr>",     desc = "Recent files" },
  },
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    for _, ext in ipairs(opts.extensions) do
      telescope.load_extension(ext)
    end
  end,
  -- init = init,
}
