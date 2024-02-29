return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "HiPhish/nvim-ts-rainbow2",
  },
  opts = {
    ensure_installed = {
      "bash", "regex",
      "rust", "toml",
      "c", "cpp", "make", "meson", "ninja", "cmake",
      "comment", "dockerfile", "gitcommit", "gitignore",
      "gitattributes", "git_rebase", "git_config",
      "lua", "luap", "luadoc", "json", "json5",
      "kdl", "vimdoc", "vim", "xml", "yaml",
      "markdown", "markdown_inline",
    },
    auto_install = true,
    highlight = { enable = true, },
    incremental_selection = { enable = true, },
    indent = { enable = true, },
    rainbow = { enable = true, },
  },
  build = ":TSUpdate",
  config = function(_, opts)
    local config = require("nvim-treesitter.configs")
    config.setup(opts)
  end,
}
