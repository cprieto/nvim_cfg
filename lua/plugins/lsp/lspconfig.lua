return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "lukas-reineke/lsp-format.nvim",
      config = true,
    }
  },
  keys = {
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions" },
    { "<leader>cr", vim.lsp.buf.rename,      desc = "Rename symbol" },
  },
  opts = {
    ensure_installed = {
      "rust_analyzer", "vimls", "dotls", "clangd",
      "docker_compose_language_service", "dockerls",
      "gopls", "jsonls", "lua_ls", "marksman",
      "neocmake", "yamlls", "typst_lsp",
    },
  },
  config = function(_, opts)
    require("neodev").setup()

    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function(client, bufn)
      lsp_zero.default_keymaps({ buffer = bufn })

      lsp_zero.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })

      if client.supports_method("textDocument/formatting") then
        require("lsp-format").on_attach(client)
      end

      -- Support for navic
      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufn)
      end
    end)
    -- Some stuff does not work in FreeBSD yet
    if os == 'FreeBSD' then
      opts.ensure_installed = vim.tbl_filter(function(e) return e == 'marksman' or e == 'clangd' end,
        opts.ensure_installed)
      vim.fn.extend(opts.automatic_installation.exclude, { "clangd" })
    end

    -- Capabilities for rustacean
    vim.g.rustaceanvim = {
      server = {
        capabilities = lsp_zero.get_capabilities(),
      }
    }

    require("mason-lspconfig").setup({
      ensure_installed = opts.ensure_installed,
      automatic_installation = opts.automatic_installation,
      handlers = {
        lsp_zero.default_setup,
        rust_analyzer = lsp_zero.noop,
      }
    })
  end,
}
