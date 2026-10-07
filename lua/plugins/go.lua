return {
  'ray-x/go.nvim',
  opts = {
    -- nvim-dap-go owns debugger setup and the shared debugger mappings.
    dap_debug = false,
  },
  dependencies = {
    'ray-x/guihua.lua'
  },
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
}
