return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main',
  build = ':TSUpdate',
  lazy = false,
  keys = {
    { "<leader>gf", function() vim.lsp.buf.format() end, desc = "Format buffer" },
  },
  init = function()
    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
        local mode = vim.api.nvim_get_mode().mode
        if vim.bo.modified == true and mode == 'n' then
          vim.lsp.buf.format({ async = false })
        end
      end,
    })
  end,
  config = function()
    if vim.fn.executable('tree-sitter') == 0 then
      vim.notify("tree-sitter cli is not installed\nyou need it for tree-sitter grammars", vim.log.levels.ERROR)
      return
    end

    local ts = require('nvim-treesitter')
    ts.setup()

    local langs = require 'langs'
    local highlights = langs.highlights()
    local installed = ts.get_installed()

    for _, name in ipairs(highlights) do
      if not vim.tbl_contains(installed, name) then
        vim.cmd(':TSInstall ' .. name)
      end
    end

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(ev)
        if vim.tbl_contains(installed, ev.match) then
          vim.treesitter.start()
        end
        if langs.has_fold(ev.match) then
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        end
        if langs.has_indent(ev.match) then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end
    })
  end,
}
