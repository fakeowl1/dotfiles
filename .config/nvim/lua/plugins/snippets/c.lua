local ok, ls = pcall(require,"luasnip")
if not ok then
	vim.notify("Failed load luasnip\n")
	return
end

local s = ls.s

local fmt = require("luasnip.extras.fmt").fmt

local i = ls.insert_node

local rep = require("luasnip.extras").rep

return {
  
}

-- ls.add_snippets("lua", {
-- 	s(
-- 		"reqm",
-- 		fmt(
-- 			[[
-- 				local ok, {} = pcall(require,"{}")
-- 				if not ok then
-- 					vim.notify("Failed load {}\n")
-- 				end
-- 			]], {
-- 				i(1, "mod"),
-- 				i(2),
-- 				rep(2),
-- 			}
-- 		)
-- 	)
-- })
