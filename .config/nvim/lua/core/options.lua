local opt = vim.opt

local ok, notify = pcall(require, "notify")
if ok then
    vim.notify = notify
end


local ok, err = pcall(function()
    vim.g.diagnostic_sings = {"", "", "", ""}
        
    -- vim.cmd('colorscheme catppuccin-macchiato')
    -- vim.cmd('colorscheme aquarium')
    vim.cmd('colorscheme everblush')
end)

if not ok then
    print(err)
end


opt.encoding = "utf-8"
opt.swapfile = false

opt.number = true
opt.relativenumber = true

opt.list = true
opt.listchars = {tab = '| '}

vim.g.lsp_path = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/" 

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.mouse = "a"

vim.g.mapleader = " "
