return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    -- LSP move
    { "<leader>gd", "<cmd>FzfLua lsp_definitions<cr>",     desc = "Go to definitions" },
    { "<leader>gr", "<cmd>FzfLua lsp_references<cr>",      desc = "Go to references" },
    { "<leader>gD", "<cmd>FzfLua lsp_declarations<cr>",    desc = "Go to declarations" },
    { "<leader>gt", "<cmd>FzfLua lsp_typedefs<cr>",        desc = "Go to type definitions" },
    { "<leader>gi", "<cmd>FzfLua lsp_implementations<cr>", desc = "Go to implementations" },
    { "<leader>gI", "<cmd>FzfLua lsp_incoming_calls<cr>",  desc = "Go to incoming calls" },
    { "<leader>go", "<cmd>FzfLua lsp_outgoing_calls<cr>",  desc = "Go to outgoing calls" },

    -- Other things that looks better in Ffz
    { "<leader>fb", "<cmd>FzfLua buffers<cr>",             desc = "List buffers" },
    { "<leader>fj", "<cmd>FzfLua jumps<cr>",               desc = "Jumplist" },
  },
}
