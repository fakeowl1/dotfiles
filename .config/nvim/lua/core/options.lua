local opt = vim.opt

vim.g.did_load_filetypes = 1

opt.encoding = "utf-8"
opt.clipboard = "unnamedplus"
opt.swapfile = false

vim.g.icons = require("core.icons")

local ok,notify = pcall(require,"notify")
if ok then 
    vim.notify = notify
end

opt.termguicolors = true
opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}

local ok,utils = pcall(require,"core.utils")
if (not ok) then
    vim.notify("Can't load utils") 
end

-- utils.run_colorscheme("vscode",function()    
--     -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#custom-menu-direction
--     utils.highlight("CmpItemAbbrDeprecated",  {guibg=NONE,gui=strikethrough,guifg=#808080})
--
--     utils.highlight("CmpItemAbbrMatch",       {guibg=NONE,guifg=#569CD6})
--     utils.highlight("CmpItemAbbrMatchFuzzy",  {guibg=NONE,guifg=#569CD6})
--     
--     utils.highlight("CmpItemKindVariable",    {guibg=NONE,guifg=#9CDCFE})
--     utils.highlight("CmpItemKindInterface",   {guibg=NONE,guifg=#9CDCFE})
--     utils.highlight("CmpItemKindText",        {guibg=NONE,guifg=#9CDCFE})
--     
--     utils.highlight("CmpItemKindFunction",    {guibg=NONE,guifg=#C586C0})
--     utils.highlight("CmpItemKindMethod",      {guibg=NONE,guifg=#C586C0})
--     
--     utils.highlight("CmpItemKindKeyword",     {guibg=NONE guifg=#D4D4D4})
--     utils.highlight("CmpItemKindProperty",    {guibg=NONE guifg=#D4D4D4})
--     utils.highlight("CmpItemKindUnit",        {guibg=NONE guifg=#D4D4D4})
--      
--     vim.g.diagnostic_signs = vim.g.icons.diagnostics.default
-- end)
-- utils.run_colorscheme("github-dark",function()
--     require("github-theme").setup({
--         theme_style = "dark_default",
--         function_style = "italic",
--         sidebars = { "qf", "vista_kind", "terminal", "packer" },
--         hide_inactive_statusline = false,
--     })
--
--     vim.g.diagnostic_signs = {
--         {name = "Error",icon = " ", color = "Default"},
--         {name = "Warn", icon = " ", color = "Default"},
--         {name = "Info", icon = " ", color = "Default"},
--         {name = "Hint", icon = " ", color = "Default"},
--     }
-- end)
utils.run_colorscheme("catppuccin",function()
    vim.g.catppucin_flavor = "mocha" -- latte, frappe, macchiato, mocha
    vim.g.diagnostics_signs = vim.g.icons.diagnostic.catppuccin
end)

-- statusline = require("core.statusline")
-- opt.statusline = "%!luaeval('statusline.active()')"

opt.number = true
opt.mouse = "a"
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.ts = 4
opt.sw = 4
opt.splitright = true
