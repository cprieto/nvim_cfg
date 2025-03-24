-- It's good practice to namespace custom handlers to avoid collisions
vim.diagnostic.handlers["my/notify"] = {
  show = function(namespace, bufnr, diagnostics, opts)
    -- In our example, the opts table has a "log_level" option
    local level = opts["my/notify"].log_level
    local name = vim.diagnostic.get_namespace(namespace).name
    local msg = string.format("%d diagnostics in buffer %d from %s",
      #diagnostics,
      bufnr,
      name)
    vim.notify(msg, level)
  end,
}
-- Users can configure the handler

return {
  "neovim/nvim-lspconfig",
  lazy = true,
  opts = {
    loclist = {
      open = true,
      severity = { min = vim.diagnostic.severity.WARN },
    },
    underline = true,
    update_in_insert = false,
    virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "●",
    },
    severity_sort = true,
    code_lens = {
      enabled = true,
    },
    float = {
      border = "rounded",
      source = "if_many",
      focusable = false,
      show_header = true,
      --prefix = "● ",
    },
    signs = {
      text = {
        [vim.diagnostic.severity.WARN] = "W",
        [vim.diagnostic.severity.HINT] = "H",
        [vim.diagnostic.severity.ERROR] = "E",
      }
    }
  },
  config = function(_, opts)
    vim.diagnostic.config(opts)
  end,
  init = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format { async = false }
      end
    })
  end,
  keys = {
    { "<leader>dd", function() vim.diagnostic.open_float(nil, { focus = true, scope = "cursor" }) end, desc = "Show diagnostic float" },
    { "<leader>dn", vim.diagnostic.goto_next,                                                    desc = "Go and show next diagnostic message" },
    { "<leader>dp", vim.diagnostic.goto_prev,                                                    desc = "Go and show previous diagnostic message" },
  }
}
