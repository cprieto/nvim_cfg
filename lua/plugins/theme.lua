return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd [[colorscheme catppuccin]]
    end,
    opts = {
      flavour = "macchiato",
      integrations = {
        harpoon = true,
        headlines = true,
        markdown = true,
        mason = true,
        neotree = true,
        noice = true,
        lsp_trouble = true,
        which_key = true,
      }
    },
  },
}
