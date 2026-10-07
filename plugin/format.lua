vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(ev)
    local clients = vim.lsp.get_clients({ bufnr = ev.buf })
    if #clients == 0 then
      return
    end

    local client = clients[1]
    local support_format = client and client.server_capabilities.documentFormattingProvider
    local mode = vim.api.nvim_get_mode().mode
    if support_format and vim.bo.modified == true and mode == 'n' then
      vim.lsp.buf.format({ async = true, bufnr = ev.buf })
    end
  end
})
