return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
  },
  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
    { "<leader>dB", function()
      vim.ui.input({ prompt = "Breakpoint condition: " }, function(condition)
        if condition and condition ~= "" then require("dap").set_breakpoint(condition) end
      end)
    end, desc = "Conditional breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Start / continue debugger" },
    { "<leader>dn", function() require("dap").step_over() end, desc = "Step over" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step out" },
    { "<leader>dq", function() require("dap").terminate() end, desc = "Stop debugger" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Repeat debug session" },
    { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle debugger UI" },
    { "<leader>de", function() require("dapui").eval() end, mode = { "n", "x" }, desc = "Evaluate expression" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle debugger REPL" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()
    require("dap-go").setup()

    dap.listeners.after.event_initialized["debug_ui"] = function() dapui.open() end
    dap.listeners.before.event_terminated["debug_ui"] = function() dapui.close() end
    dap.listeners.before.event_exited["debug_ui"] = function() dapui.close() end

    -- Mason puts codelldb on PATH; Rustaceanvim detects the same executable.
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = { command = "codelldb", args = { "--port", "${port}" } },
    }
    for _, language in ipairs({ "c", "cpp" }) do
      dap.configurations[language] = {
        {
          name = "Launch executable",
          type = "codelldb",
          request = "launch",
          program = function()
            local path = vim.fn.input("Executable: ", vim.fn.getcwd() .. "/build/", "file")
            return path ~= "" and vim.fn.fnamemodify(path, ":p") or dap.ABORT
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
    end
  end,
}
