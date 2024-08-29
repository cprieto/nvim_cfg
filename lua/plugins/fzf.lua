return {
  "ibhagwan/fzf-lua",
  dependencies = {
    { "rktjmp/lush.nvim", lazy = true },
  },
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    -- LSP move
    { "<leader>gd", "<cmd>FzfLua lsp_definitions<cr>",            desc = "Go to definitions" },
    { "<leader>gr", "<cmd>FzfLua lsp_references<cr>",             desc = "Go to references" },
    { "<leader>gD", "<cmd>FzfLua lsp_declarations<cr>",           desc = "Go to declarations" },
    { "<leader>gt", "<cmd>FzfLua lsp_typedefs<cr>",               desc = "Go to type definitions" },
    { "<leader>gi", "<cmd>FzfLua lsp_implementations<cr>",        desc = "Go to implementations" },
    { "<leader>gI", "<cmd>FzfLua lsp_incoming_calls<cr>",         desc = "Go to incoming calls" },
    { "<leader>go", "<cmd>FzfLua lsp_outgoing_calls<cr>",         desc = "Go to outgoing calls" },
    { "<leader>gR", "<cmd>FzfLua resume<cr>",                     desc = "Show previous picker" },

    -- Other things that looks better in Ffz
    { "<leader>fb", "<cmd>FzfLua buffers<cr>",                    desc = "List buffers" },
    { "<leader>fj", "<cmd>FzfLua jumps<cr>",                      desc = "Jumplist" },
    { "<leader>fs", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc = "Search symbols" },
    { "<leader>fa", "<cmd>FzfLua awesome_colorschemes<cr>",       desc = "List awesome color schemes" },
  },
}
