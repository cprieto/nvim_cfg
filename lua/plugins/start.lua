local function new_file()
  local filename = vim.fn.input("Filename: ")
  vim.cmd("e " .. filename)
end

return {
  "nvimdev/dashboard-nvim",
  config = function()
    local dashboard = require("dashboard")

    local expl_icon, expl_hl, _ = MiniIcons.get('filetype', 'telescopeprompt')
    local lazy_icon, lazy_hl, _ = MiniIcons.get('filetype', 'lazy')
    local new_icon, new_hl = MiniIcons.get('default', 'file')
    local quit_icon, quit_hl = MiniIcons.get('default', 'default')

    dashboard.setup({
      theme = "hyper",
      config = {
        shortcut = {
          {
            icon = expl_icon,
            icon_hl = expl_hl,
            desc = " Explorer ",
            key = "e",
            group = "DashboardShortCut",
            action = function()
              vim.cmd [[Telescope file_browser]]
            end,
          },
          { icon = new_icon,  icon_hl = new_hl,  desc = " New ",  key = "n", group = "DashboardShortCut", action = new_file, },
          { icon = quit_icon, icon_hl = quit_hl, desc = " Quit ", key = "q", group = "DashboardShortCut", action = function()
            vim.cmd [[quit]] end, },
          {
            icon = lazy_icon,
            icon_hl = lazy_hl,
            desc = " Lazy ",
            key = "l",
            group = "DashboardShortCut",
            action = function()
              vim.cmd [[Lazy]]
            end,
          }
        },
        week_header = {
          enable = true,
        },
      },
    })
  end,
  event = { "VimEnter" },
}
