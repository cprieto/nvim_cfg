return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  keys = {
    { "<c-s>", function() vim.lsp.buf.signature_help() end, desc = "Show signature" },
  },
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "ray-x/cmp-treesitter",
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip",
  },
  opts = {
    preselect = "item",
    completion = {
      completeopt = "menu,menuone,noinsert",
    },
    window = {
      documentation = { border = "rounded" },
      completion = { border = "rounded" },
    },
    sources = {
      { name = "nvim_lsp",               keyword_length = 1 },
      { name = "nvim_lsp_signature_help" },
      { name = "treesitter",             keyword_length = 1 },
      { name = "nvim_lua",               keyword_length = 1 },
      { name = "buffer",                 keyword_length = 3 },
    },
  },
  config = function(_, opts)
    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_cmp()

    local cmp = require("cmp")

    cmp.setup(vim.fn.extend(opts, {
      mapping = {
        ["<cr>"] = cmp.mapping.confirm({ select = false }),
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = require("lspkind").cmp_format({
          mode = "symbol_text",
          preset = "codicons",
          menu = {
            nvim_lsp = "\u{f0627} [LSP]",
            treesitter = "\u{f1bb} [Treesitter]",
            buffer = "\u{f0219} [Buffer]",
            lua = "\u{e620} [Lua]",
          },
        }),
      }
    }))
  end,
}
