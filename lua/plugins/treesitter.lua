return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  dependencies = {
    {
      "hiphish/rainbow-delimiters.nvim",
      opts = {
        highlight = {
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      },
      config = function(_, opts)
        require("rainbow-delimiters.setup").setup(opts)
      end,
    }
  },
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "rust", "lua", "vimdoc", "toml",
      "cpp", "c", "go", "gosum", "gomod",
      "gowork", "make", "tera", "markdown",
      "markdown_inline", "fish",
    },
    auto_install = true,
    rainbow = { enable = true },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn", -- set to `false` to disable one of the mappings
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  },
  config = function(_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
  end,
}
