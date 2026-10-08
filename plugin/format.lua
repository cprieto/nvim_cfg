vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(ev)
    if not vim.bo[ev.buf].modified then
      return
    end

    local clients = vim.lsp.get_clients({ 
      bufnr = ev.buf,
      method = "textDocument/formatting",
    })

    if #clients == 0 then
      return
    end

    vim.lsp.buf.format({
      bufnr = ev.buf,
      id = clients[1].id,
      async = false,
      timeout = 2000,
    })
  end
})
