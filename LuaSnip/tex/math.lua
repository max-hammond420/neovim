local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  -- Examples of Greek letter snippets, autotriggered for efficiency
  s({trig=";a",
  snippetType = "autosnippet",
  wordTrig = false,
  regTrig = false},
    {
      t("\\alpha"),
    }
  ),
  s({trig = ";b",
  snippetType = "autosnippet",
  wordTrig = false,
  regTrig = false},
    {
      t("\\beta"),
    }
  ),
  s({trig = ";g",
  snippetType = "autosnippet",
  wordTrig = false,
  regTrig = false},
    {
      t("\\gamma"),
    }
  ),

  -- only trigger when whitespace is the preceding character
  s({trig = "(%s)eq",
  snippetType = "autosnippet",
  dscr = "A LaTeX equation environment",
  wordTrig = false,
  regTrig = true},
    fmt(
      [[
        \begin{align*}
            <>
        \end{align*}
      ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) },
      -- This is where I specify that angle brackets are used as node positions.
      { delimiters = "<>" }
    )
  ),

  -- \frac{}{}
  s({trig = '([^%a])ff',
  snippetType = "autosnippet",
  wordTrig = false,
  regTrig = true},
    fmta(
      [[<>\frac{<>}{<>}]],
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2)
      }
    )
  ),

}

