local ok, ls = pcall(require,"luasnip")
if not ok then
  vim.notify("Failed load luasnip\n")
end

ls.setup({
  history = true,
  update_events = "TextChanged,TextChangedI",
  enable_autosnippets = true,
})

local utils = require("core.utils")
local snippets_directory = utils.scandir("$HOME/.config/nvim/lua/snippets")

-- Load snippets from directory
for _, snippet_path in ipairs(snippets_directory) do
  local snippet_name = get_file_name(snippet_path)
  local ok, snippet_path = pcall(require, "plugins.snippets." .. snippet_name)
  if ok then
    ls.add_snippets(snippet_name, snippet_path)
  end
end

-- Keybind options
local mapopts = {silent = true, expr = true}

-- c-k is expansion key
vim.keymap.set({"s", "i"}, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    return "<C-k>"
  end
end, mapopt)

-- c-j is jump backwards key
vim.keymap.set({"s", "i"}, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  else
    return "<C-j>"
  end
end, mapopt)

-- c-l is selecting withing a list of options
vim.keymap.set({"s", "i"}, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  else
    return "<C-l"
  end
end, mapopt)

require("luasnip/loaders/from_vscode").lazy_load() 
