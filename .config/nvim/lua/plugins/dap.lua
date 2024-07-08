local ok,dap = pcall(require,"dap")
if not ok then
    vim.notify("Failed to load dap\n\n")
    return
end

local keymap = vim.keymap.set 

keymap("n", "<F5>",  dap.continue)
keymap("n", "<F10>", dap.step_over)
keymap("n", "<F11>", dap.step_into)
keymap("n", "<F12>", dap.step_out)
-- keymap("n", "<leader>b", dap.toggle_breakpoint)
-- keymap("n", "<leader>B",  function() 
--   dap.set_breakpoint{vim.fn.input("Breakpoint condition: ")} 
-- end)
keymap("n", "<leader>lp", function() 
  dap.set_breakpoint{nil, nil, vim.fn.input('Log point message: ')} 
end)
keymap("n", "<leader>dr", dap.repl.open)
keymap("n", "<leader>dl", dap.run_last)

-- dap.adapters.python = {
--     type = "executable",
--     command = 
--     args = { "-m","debugpy.adapter" }
-- }
