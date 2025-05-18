local ok, ls = pcall(require,"luasnip")
if not ok then
  vim.notify("Failed load luasnip\n")
  return
end

local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require("luasnip.extras").rep

local i = ls.insert_node
local t = ls.text_node
local s = ls.snippet

return {}
