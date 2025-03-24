vim.filetype.add({ extension = { tera = "tera" } })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tera",
  callback = function(event)
    vim.bo[event.buf].commentstring = "{# %s #}"
  end,
})
