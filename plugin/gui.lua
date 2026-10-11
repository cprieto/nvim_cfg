vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    if vim.g.GuiLoaded == 1 then
      vim.o.guifont = "JetBrainsMono Nerd Font:h14"
    end
  end,
})
