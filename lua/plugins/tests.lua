return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "fredrikaverpil/neotest-golang",
      "orjangj/neotest-ctest",
    },
    keys = {
      { "<leader>Tn", function() require("neotest").run.run() end,                     desc = "Run nearest test" },
      { "<leader>Tf", function() require("neotest").run.run(vim.fn.expand("%:p")) end, desc = "Run file tests" },
      { "<leader>Ta", function() require("neotest").run.run(vim.fn.getcwd()) end,      desc = "Run project tests" },
      { "<leader>Td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug nearest test" },
      { "<leader>Tl", function() require("neotest").run.run_last() end,                desc = "Repeat tests" },
      { "<leader>Ts", function() require("neotest").summary.toggle() end,              desc = "Toggle test summary" },
      { "<leader>To", function() require("neotest").output.open({ enter = true }) end, desc = "Show test output" },
      { "<leader>Tp", function() require("neotest").output_panel.toggle() end,         desc = "Toggle test output panel" },
      { "<leader>Tq", function() require("neotest").run.stop() end,                    desc = "Stop tests" },
      {
        "<leader>Tc",
        function()
          vim.ui.input({ prompt = "CTest build directory: ", default = vim.fn.getcwd() .. "/build" }, function(path)
            if path and path ~= "" then
              Snacks.terminal({ "ctest", "--test-dir", vim.fn.fnamemodify(path, ":p"), "--output-on-failure" },
                { auto_close = false })
            end
          end)
        end,
        desc = "Run CTest suite (C / C++)"
      },
    },
    opts = function()
      return {
        adapters = {
          require("rustaceanvim.neotest"),
          require("neotest-golang")({ dap_mode = "dap-go" }),
          require("neotest-ctest").setup({ dap_adapter = "codelldb" }),
        },
      }
    end,
  },
}
