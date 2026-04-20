return {
  'vieitesss/miniharp.nvim',
  version = '*',
  opts = {
    autoload = true,
    autosave = true,
    show_on_autoload = false,
    ui = {
      position = 'center',
      show_hints = true,
      enter = true,
    }
  },
  keys = {
    { '<leader>mt', function() require('miniharp').toggle_file() end, desc = "miniharp: toggle file mark" },
    { '<C-n>',      function() require('miniharp').next() end,        desc = "miniharp: next file mark" },
    { '<C-p>',      function() require('miniharp').prev() end,        desc = "miniharp: prev file mark" },
    { '<leader>ml', function() require('miniharp').show_list() end,   desc = "miniharp: prev file mark" },
  }
}
