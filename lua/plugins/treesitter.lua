return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "hiphish/rainbow-delimiters.nvim",
      config = function()
        require("rainbow-delimiters.setup").setup()
      end,
    }
  },
  opts = {
    ensure_installed = {
      "bash", "regex", "fish", "elixir", "eex", "proto",
      "rust", "toml", "python", "erlang", "capnp",
      "c", "cpp", "make", "meson", "ninja", "cmake",
      "comment", "dockerfile", "gitcommit", "gitignore",
      "gitattributes", "git_rebase", "git_config",
      "lua", "luap", "luadoc", "json", "json5",
      "kdl", "vimdoc", "vim", "xml", "yaml",
      "markdown", "markdown_inline", "gpg", "typst",
      "go", "gomod", "gosum", "gotmpl", "gowork",
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
