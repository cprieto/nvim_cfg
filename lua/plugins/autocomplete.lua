return {
    'saghen/blink.cmp',
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
            },
            list = {
                selection = {
                    preselect = true,
                    auto_insert = true,
                }
            }
        },
        sources = {
            default = { 'lazydev', 'lsp', 'path', 'buffer' },
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
