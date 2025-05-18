local opt = vim.opt

local ok, notify = pcall(require, "notify")
if ok then
  vim.notify = notify
end

-- Setup colorscheme
local ok, err = pcall(function()
  local colorscheme = "catppuccin-mocha"
  vim.g.diagnostic_sings = {" ", " ", " ", " "}
  -- vim.g.diagnostic_sings = {"", "", "", ""}
  -- if colorscheme == "nord" or colorscheme == "catppuccin-macchiato" then 
  --   vim.g.diagnostic_sings = {"", "", "", ""}
  -- else
  --   vim.g.diagnostic_sings = {" ", " ", " ", " "}
  -- end

  opt.termguicolors = true
end)

if not ok then
  print(err)
end

opt.encoding = "utf-8"
opt.swapfile = false
opt.clipboard = "unnamedplus"

opt.number = true
opt.relativenumber = true

vim.g.lsp_path = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/" 
-- vim.lsp.set_log_level("debug")
vim.g.mapleader = ","

opt.list = true
opt.listchars = {multispace = "·", tab = "⬄ "}

opt.splitbelow = true
opt.splitright = true

opt.undofile = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.mouse = "a"

vim.ui.enable = false
