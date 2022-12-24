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

vim.g.mapleader = " "

opt.list = true
opt.listchars = {tab = '| '}

vim.g.diagnostic_sings = {"", "", "", ""}

opt.mouse = "a"

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
