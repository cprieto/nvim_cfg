return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = { "folke/lazydev.nvim", {
    "xzbdmw/colorful-menu.nvim",
    config = true
  } },
  opts = {
    snippets = {
      preset = "luasnip",
    },
    keymap = {
      preset = "enter"
    },
    completion = {
      menu = {
        border = "single",
        draw = {
          columns = { { "kind_icon" }, {
            "label",
            gap = 1
          } },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end
            }
          }
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 50
      },
      ghost_text = {
        enabled = true,
      }
    },
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100
        }
      }
    }
  }
}
