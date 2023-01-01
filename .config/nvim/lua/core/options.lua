local opt = vim.opt

local ok, notify = pcall(require, "notify")
if ok then
    vim.notify = notify
end

vim.cmd[[colorscheme catppuccin-macchiato]]

opt.encoding = "utf-8"
opt.clipboard = "unnamedplus"
opt.swapfile = false

opt.number = true
opt.relativenumber = true

opt.list = true
opt.listchars = {tab = '| '}

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.mouse = "a"

vim.g.mapleader = " "

vim.g.diagnostic_sings = {"", "", "", ""}
vim.g.lsp_path = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/" 
