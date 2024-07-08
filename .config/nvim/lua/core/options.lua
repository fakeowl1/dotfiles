local opt = vim.opt

local ok, notify = pcall(require, "notify")
if ok then
  vim.notify = notify
end

-- Setup colorscheme
local ok, err = pcall(function()
  local colorscheme = "kanagawa-wave"
  if colorscheme == "nord" then 
    vim.g.diagnostic_sings = {"", "", "", ""}
  end
  
  if colorscheme == "catppuccin-macchiato" then
    vim.g.diagnostic_sings = {"", "", "", ""}
  end
  
  vim.g.diagnostic_sings = {" ", " ", " ", " "}

  -- if colorscheme == "everforest" then 
  --   vim.g.diagnostic_sings = {" ", " ", " ", " "}
  -- end

  -- vim.cmd('colorscheme catppuccin-macchiato')
  -- vim.cmd('colorscheme aquarium')
  opt.termguicolors = true
end)

if not ok then
  print(err)
end

-- vim.opt.statusline=statusline_output
-- if ok then
--
-- end

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
