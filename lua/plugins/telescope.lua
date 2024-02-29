local function build_cmd(cmd)
  if type(cmd) == 'string' then
   vim.system(cmd):wait()
  elseif type(cmd) == 'table' then
    for _, item in ipairs(cmd) do
      vim.system(item):wait()
    end
  end
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
        local cmd =  {"make"}
        if os == 'Windows_NT' then
          cmd = {
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release",
            "cmake --build build --config Release",
            "cmake --install build --prefix build",
          }
        elseif os == 'FreeBSD' then
          cmd = { "gmake" }
        end
        build_cmd(cmd)
      end,
    },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Opened buffers" },
    { "<leader>nl", "<cmd>Telescope noice<cr>", desc = "View notifications" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fc", "<cmd>Telescope frecency<cr>", desc = "Recent files" },
  },
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    for _, ext in ipairs(opts.extensions) do
      telescope.load_extension(ext)
    end
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
