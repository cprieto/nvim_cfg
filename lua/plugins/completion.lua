local source_icon = {
  LSP = '󰘧',
  Buffer = '',
  Snippets = '',
  Cmdline = '',
}

return {
  'saghen/blink.cmp',
  cond = function() return vim.loop.os_uname().sysname ~= 'FreeBSD' end,
  dependencies = {
    {
      "xzbdmw/colorful-menu.nvim",
      config = true
    },
  },
  version = '1.*',
  opts = {
    keymap = { preset = 'enter' },
    signature = { enabled = true },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      menu = {
        border = "single",
        draw = {
          treesitter = { 'lsp' },
          columns = {
            { "source_name", gap = 1 },
            { "kind_icon" },
            {
              "label",
              gap = 1
            },
          },
          components = {
            source_name = {
              width = { max = 30 },
              text = function(ctx) return source_icon[ctx.source_name] or ('[' .. ctx.source_name .. ']') end,
              highlight = "BlinkCmpSource",
            },
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
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        }
      }
    },
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      per_filetype = {
        lua = { inherit_defaults = true, "lazydev" },
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100
        }
      }
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
