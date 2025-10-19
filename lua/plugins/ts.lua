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

        for _, name in ipairs(langs) do
          if not vim.tbl_contains(installed, name) then
            vim.cmd(':TSInstall ' .. name)
          end
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
