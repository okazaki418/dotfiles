local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({trig = "gray"}, {t({"{{<gray \""}),i(0),t({"\">}}"})}),
  s({trig = "tweet"}, {t({"{{<tweet user=\"found136\" id=\""}),i(0),t({"\">}}"})}),
  s({trig = "image"}, {t({"{{< figure src=\""}),i(0),t({"\" title=\""}),t({"\" class=\"center\">}}"})}),
}
