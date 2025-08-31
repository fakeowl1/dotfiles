local ok, ls = pcall(require,"luasnip")
if not ok then
  vim.notify("Failed load luasnip\n")
end

local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require("luasnip.extras").rep

local i = ls.insert_node
local t = ls.text_node
local s = ls.snippet

return {
  s("func",
    fmta(
      [[
        <output>, err := <func>()
        if err != nil {
          <finish>
        }
      ]], {
        output = i(1, "out"),
        func = i(2, "func"),
        finish = i(3, "// some code")
      }
    )
  ),
  
  s(
    "main",
    fmta(
      [[
        func main() {
        <><>
        }
      ]],
      { t("\t"), i(0) }
    )
  ),
}
