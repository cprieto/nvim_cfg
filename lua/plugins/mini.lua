return {
  {
    "echasnovski/mini.cursorword",
    version = '*',
    config = true,
    events = { "BufReadPost", "BufNewFile" },
  },
  {
    "echasnovski/mini.pairs",
    version = "*",
    config = true,
    events = { "BufReadPost", "BufNewFile" },
  },
  {
    "echasnovski/mini.comment",
    version = "*",
    config = true,
    events = { "BufReadPost", "BufNewFile" },
  },
  {
    "echasnovski/mini.icons",
    version = "false",
    config = function()
      require('mini.icons').setup()
      MiniIcons.mock_nvim_web_devicons()
    end,
  }
}
