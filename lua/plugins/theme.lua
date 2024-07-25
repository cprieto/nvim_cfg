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
      }
    },
  },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = true,
  -- },
  -- {
  --   "neanias/everforest-nvim",
  --   lazy = true,
  -- },
  -- {
  --   "ribru17/bamboo.nvim",
  --   lazy = true,
  -- },
  -- {
  --   "uloco/bluloco.nvim",
  --   lazy = true,
  -- },
  -- {
  --   "zaldih/themery.nvim",
  --   lazy = false,
  --   config = true,
  --   priority = 1000,
  --   opts = {
  --     themes = { "tokyonight", "catppuccin", "everforest", "kanagawa", "bamboo", "bluloco" },
  --     livePreview = true,
  --   },
  -- }
}
