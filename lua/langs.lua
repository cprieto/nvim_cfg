-- This is mostly used for treesitter main branch
-- lang, higlight, fold, indent
local languages = {
  'luadoc',
  'regex',
  'ron',
  'toml',
  'vimdoc',
  { 'bash',  fold = true },
  { 'make',  fold = true },
  { 'vim',   fold = true },
  { 'cpp',   fold = true,     indent = true },
  { 'cuda',  fold = true,     indent = true },
  { 'rust',  fold = true,     indent = true, lsp = 'bacon_ls' },
  { 'just',  fold = true,     indent = true, lsp = 'just' },
  { 'lua',   fold = true,     indent = true, lsp = 'luals' },
  { 'cmake', fold = true,     indent = true, lsp = 'neocmakelsp' },
  { 'fish',  lsp = 'fish-lsp' },
  {
    'c',
    fold = true,
    indent = true,
    lsp = function()
      if vim.fn.executable('clangd') == 1 then
        return 'clangd'
      elseif vim.fn.executable('ccls') == 1 then
        return 'ccls'
      else
        return nil
      end
    end
  },
}

return {
  -- Return the language highlights
  highlights = function()
    return vim.tbl_map(function(item)
      if type(item) == 'string' then
        return item
      elseif type(item) == 'table' then
        return item[1]
      end
    end, languages)
  end,

  -- Tell us if a given language has folds defined
  has_fold = function(lang)
    for _, entry in ipairs(languages) do
      if type(entry) == "table" then
        if entry[1] == lang then
          return entry.fold == true
        end
      elseif entry == lang then
        return false
      end
    end
    -- If the language isn't listed at all
    return false
  end,

  -- Tell us if a given language has indent defined
  has_indent = function(lang)
    for _, entry in ipairs(languages) do
      if type(entry) == "table" then
        if entry[1] == lang then
          return entry.indent == true
        end
      elseif entry == lang then
        return false
      end
    end
    -- If the language isn't listed at all
    return false
  end,

  enable_lsp = function()
    local lsp_langs = {}
    for _, item in ipairs(languages) do
      if type(item) == "table" and item.lsp then
        local lsp = item.lsp
        if type(lsp) == "function" then
          lsp = lsp()
        end

        if lsp then
          table.insert(lsp_langs, lsp)
        end
      end
    end

    vim.lsp.enable(lsp_langs)

    ---@type vim.diagnostic.Opts
    local diag_opts = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      numhl = {
        [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
        [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
        [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
        [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
      },
      linehl = { [vim.diagnostic.severity.ERROR] = "ErrorMsg" },
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '✘',
          [vim.diagnostic.severity.WARN] = '▲',
          [vim.diagnostic.severity.HINT] = '⚑',
          [vim.diagnostic.severity.INFO] = '»',
        },
      },
    }

    vim.diagnostic.config(diag_opts)
  end,
}
