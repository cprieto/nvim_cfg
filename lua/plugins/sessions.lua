return {
  "rmagatti/auto-session",
  config = true,
  opts = {
    restore_upcoming_session = true,
    auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  },
  event = "VeryLazy",
}
