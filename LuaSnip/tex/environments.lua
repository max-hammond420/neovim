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

return{

  s({trig="([^%a])env",
  snippetType = "autosnippet",
  dscr = "creating a LaTeX environment",
  wordTrig = false,
  regTrig = true},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1),  -- this node repeats insert node i(1)
    }
  )
  ),

  s({trig = "([^%a])para",
  snippetType = "autosnippet",
  dscr = "A LaTeX paragraph environment",
  wordTrig = false,
  regTrig = true},
  fmt(
    [[
      \paragraph{
          <>
      }
    ]],
    -- The insert node is placed in the <> angle brackets
    { i(1) },
    -- This is where I specify that angle brackets are used as node positions.
    { delimiters = "<>" }
  )
  ),

}
