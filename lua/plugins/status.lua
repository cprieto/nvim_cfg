return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        {
            "SmiteshP/nvim-navic",
            opts = {
                lsp = { auto_attach = true },
            },
        },
    },
    opts = {
        options = {
            disabled_filetypes = { 'dashboard', 'snacks_dashboard' },
            section_separators = { left = '', right = '' },
        },
        extensions = { 'quickfix', 'lazy', 'fzf' },
    }
}
