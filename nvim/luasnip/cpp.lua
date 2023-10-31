local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({trig = "main"}, {t({"int main() {","  "}),i(0),t({"","}"})}),
  s({trig = "for"}, {t("for("),i(0),t(") {}")})
}
