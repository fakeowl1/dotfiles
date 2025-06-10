local dap = require("dap")
local dapui = require("dapui")

local nmap = function(mode, keys, func, desc) 
  if desc then 
    desc = 'DAP: ' .. desc
  end
  vim.keymap.set(mode, keys, func, {desc = desc})
end

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Enable dap
nmap("n", "<leader>dc", dap.continue, "Start debug session")
nmap("n", "<leader>ds", dap.step_over, "Run again")
nmap("n", "<leader>dsi", dap.step_into, "[S]tep into a function or method")
nmap("n", "<leader>dso", dap.step_out, "[S]tep out of a function or method")

nmap("n", "<leader>tb", dap.toggle_breakpoint, "[C]reates or removes a breakpoint at the current line")
nmap( "n", "<leader>tB", dap.set_breakpoint, "Same as toggle_breakpoint, but is guranteed to overwrite previous breakpoint")

nmap(
  "n",
  "<leader>lp", 
  function()
    dap.set_breakpoint{nil, nil, vim.fn.input('Log point message: ')} 
  end
)

nmap("n","<leader>dr",dap.repl.open,"Open a debug-console")
nmap("n","<leader>dl",dap.run_last,"Re-runs the last debug adapter")


nmap(
  {"n", "v"}, 
  "<Leader>dh",
  require("dap.ui.widgets").hover,
  "View the value for the expression under the cursor in a floating window"
)

nmap(
  {'n', 'v'}, 
  "<Leader>dp",
  require("dap.ui.widgets").preview,
  "Like hover but uses the preview window"
)

nmap(
  "n", 
  "<Leader>df", 
  function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
  end,
  "Opens the contents of the widget in a floating window anchored at the cursor"
)

nmap(
  "n", 
  "<Leader>ds", 
  function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
  end,
  "View the current scopes in a centered floating window"
)

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
       local name = vim.fn.input('Executable name (filter): ')
       return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = '${workspaceFolder}'
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'gdb',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}'
  },
}

-- dap.adapters.python = {
--     type = "executable",
--     command = 
--     args = { "-m","debugpy.adapter" }
-- }
