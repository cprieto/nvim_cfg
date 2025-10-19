return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    build = ':TSUpdate',
    lazy = false,
    config = function(opts)
        local ts = require('nvim-treesitter')
        ts.setup()

        local langs = require('langs').highlights()
        local installed = ts.get_installed()

        local not_installed = vim.tbl_filter(function(item)
            return not vim.tbl_contains(langs, item)
        end, langs)


        -- Install those languages not installed
        if #not_installed > 0 then
            ts.install(not_installed)
        end

        vim.api.nvim_create_autocmd('FileType', {
            callback = function(ev)
                if vim.tbl_contains(installed, ev.match) then
                    vim.treesitter.start()
                end
            end
        })
    end,
}
