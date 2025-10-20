return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            close_command = function(n) Snacks.bufdelete(n) end,
            right_mouse_command = function(n) Snacks.bufdelete(n) end,
            diagnostics = "nvim_lsp",
            offsets = {
              {
                filetype = 'snacks_layout_box',
                text = '󰙅  File Explorer',
                separator = true,
              },
            }
        },
    },
    config = function(_, opts)
        require('bufferline').setup(opts)
        vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end
        })
    end,
}
