local core = {"options", "globals", "keybinds", "autocmds", "plugins"}

for _,source in ipairs(core) do
    local ok, fault = pcall(require,'core.' .. source)
    if not ok then
        vim.notify("Failed to load " .. source .."\n\n" .. fault )
    end
end
