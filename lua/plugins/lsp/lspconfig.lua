return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions" },
    { "<leader>cr", vim.lsp.buf.rename, desc = "Rename symbol" },
  },
  opts = {
    ensure_installed = {
      "rust_analyzer", "vimls", "dotls", "clangd",
      "docker_compose_language_service", "dockerls",
      "gopls", "jsonls", "lua_ls", "marksman",
      "neocmake", "yamlls", "typst_lsp",
    },
    automatic_installation = {
      exclude = { "rust_analyzer" },
    },
  },
  config = function(_, opts)
    require("neodev").setup()

    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function(_, bufn)
      lsp_zero.default_keymaps({ buffer = bufn })
      lsp_zero.set_sign_icons({
        error = "",
        warning = "",
        hint = "",
        information = "",
      })
    end)
    -- Some stuff does not work in FreeBSD yet
    if os == 'FreeBSD' then
      opts.ensure_installed = vim.tbl_filter(function(e) return e == 'marksman' or  e =='clangd' end, opts.ensure_installed)
      vim.fn.extend(opts.automatic_installation.exclude, { "clangd" })
    end

    require("mason-lspconfig").setup({
      ensure_installed = opts.ensure_installed,
      automatic_installation = opts.automatic_installation,
      handlers = {
        lsp_zero.default_setup,
      }
    })
  end,
}

