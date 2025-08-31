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
  s(
    "docclass", 
    fmta([[
      \documentclass[<format>, <font_size>]{<class>},
      <finish>
    ]], {
      format = i(1, "a4paper"),
      font_size = i(2, "14pt"),
      class = i(3, "extraarticle"),
      finish = i(4),
    }
    )
  ),

  s(
    "input", 
    fmt([[
      \usepackage[T2A,T1]{{fontenc}}
      \usepackage[utf8]{{inputenc}}
      \usepackage[english,{}]{{babel}}
      {}
    ]], {
      i(1, "ukrainian"),
      i(2),
    }
    )
  ),
  
  s(
    "begin",
    fmta([[
      \begin{<env>}
        <finish>
      \end{<env_same>}
    ]], {
      env = i(1),
      finish = i(2),
      env_same = rep(1),
    })
  ),
  
  -- s(
  --   "ff",
  --   fmta([[
  --     \frac{<>}{<>} <>
  --   ]], {
  --     i(1),
  --     i(2),
  --   })
  -- ),

  s(
    "eq",
    fmta([[
      \begin{equation*}
        <>
      \end{equation}
    ]], {
      i(1),
    })
  ),

}
