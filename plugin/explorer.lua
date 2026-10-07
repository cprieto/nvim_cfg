-- Let :q quit the last editing window instead of leaving an explorer-only tab.
vim.api.nvim_create_autocmd("QuitPre", {
  group = vim.api.nvim_create_augroup("ExplorerQuit", { clear = true }),
  callback = function()
    if not package.loaded["snacks.picker"] then return end

    local explorers = Snacks.picker.get({ source = "explorer" })
    if #explorers == 0 then return end

    local explorer_wins = {}
    for _, picker in ipairs(explorers) do
      for _, win in ipairs(picker.layout:get_wins()) do
        if win.win then explorer_wins[win.win] = true end
      end
    end

    local current = vim.api.nvim_get_current_win()
    if explorer_wins[current] then return end

    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      if win ~= current and not explorer_wins[win]
        and vim.api.nvim_win_get_config(win).relative == "" then
        return
      end
    end

    for _, picker in ipairs(explorers) do
      picker:close()
      -- Picker cleanup is scheduled; close its windows before :q counts them.
      picker.layout:close()
    end
  end,
})
