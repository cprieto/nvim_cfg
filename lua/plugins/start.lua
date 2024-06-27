local function new_file()
  local filename = vim.fn.input("Filename: ")
  vim.cmd("e " .. filename)
end

return {
  "nvimdev/dashboard-nvim",
  config = true,
  opts = {
    theme = "hyper",
    config = {
      shortcut = {
        { icon = "", desc = " Explorer ", key = "e", group = "DashboardShortCut", action = function() vim.cmd [[Telescope file_browser]] end, },
        { icon = "", desc = " New ", key = "n", group = "DashboardShortCut", action = new_file, },
        { icon = "󰗼", desc = " Quit ", key = "q", group = "DashboardShortCut", action = function() vim.cmd [[quit]] end, },
        { icon = "", desc = " Lazy ", key = "l", group = "DashboardShortCut", action = function() vim.cmd [[Lazy]] end, }
      },
      week_header = {
        enable = true,
      },
    },
  },
  event = { "VimEnter" },
}
