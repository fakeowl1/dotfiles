local ok, ls = pcall(require,"luasnip")
if not ok then
  vim.notify("Failed load luasnip\n")
end

local s = ls.s

local fmt = require("luasnip.extras.fmt").fmt

local i = ls.insert_node

local rep = require("luasnip.extras").rep

ls.setup({
	history = true,

	update_events = "TextChanged,TextChangedI",

	enable_autosnippets = true,
})


ls.add_snippets("lua", {
	s(
		"reqm",
		fmt(
			[[
				local ok, {} = pcall(require,"{}")
				if not ok then
					vim.notify("Failed load {}\n")
				end
			]], {
				i(1, "mod"),
				i(2),
				rep(2),
			}
		)
	)
})

-- Configuring keybinds
local mapopts = { silent = true, expr = true }

-- c-k is expansion key
vim.keymap.set({ "s", "i" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	else
    return "<C-k>"
  end
end, mapopt)

-- c-j is jump backwards key
vim.keymap.set({ "s", "i" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
	else
    return "<C-j>"
  end
end, mapopt)

-- c-l is selecting withing a list of options
vim.keymap.set({ "s", "i" }, "<C-l>", function()
  if ls.choice_active() then
		ls.change_choice(1)
	else
    return "<C-l"
  end
end, mapopt)

require("luasnip/loaders/from_vscode").lazy_load() 
