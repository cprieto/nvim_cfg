return {
  'ray-x/go.nvim',
  config = true,
  dependencies = {
    'ray-x/guihua.lua'
  },
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
}
