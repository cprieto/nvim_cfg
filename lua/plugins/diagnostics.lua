return {
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    lazy = false,
    priority = 900,
    opts = {
      preset = 'ghost',
      options = {
        multilines = { 
          enabled = true, 
          always_show = true 
        },
        add_messages = { display_count = true },
        show_all_diags_on_cursorline = true,
        show_source = { enabled = true, if_many = true },
      },
    },
  },
  {
    'rachartier/tiny-code-action.nvim',
    dependencies = { 'folke/snacks.nvim' },
    event = 'LspAttach',
    opts = {
      backend = 'vim',
      picker = 'snacks',
    },
    keys = {
      {
        '<leader>ca',
        function() require('tiny-code-action').code_action() end,
        mode = { 'n', 'x' },
        desc = 'Code actions',
      },
    },
  },
}
