local ok,dap = pcall(require,"dap")
if not ok then
    vim.notify("Failed to load dap\n\n")
    return
end

-- dap.adapters.python = {
--     type = "executable",
--     command = 
--     args = { "-m","debugpy.adapter" }
-- }
