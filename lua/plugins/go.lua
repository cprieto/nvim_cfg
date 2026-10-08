return {
  'ray-x/go.nvim',
  opts = {
    -- nvim-dap-go owns debugger setup and the shared debugger mappings.
    dap_debug = false,
    -- These optional text objects require nvim-treesitter rather than Arborist.
    textobjects = false,
  },
  dependencies = {
    'ray-x/guihua.lua'
  },
  ft = { "go", "gomod" },
}
