
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local t = ls.text_node

-- snippet que crea sección de plugin
return {
  s("plugin", {
    t("-- {{ "), 
    i(1, "Plugin"), 
    f(function(args)
      local name = args[1][1] or "Plugin"
      local header_base = "-- {{ " .. name .. " "
      local remaining = 100 - #header_base
      if remaining < 0 then remaining = 0 end
      return " " .. string.rep("-", remaining)
    end, {1}),
    t({"", "", ""}),
    i(2),  -- contenido en el centro
    t({"", "", ""}),
    t("-- }} "), 
    f(function(args)
      return args[1][1] or "Plugin"  -- replica el nombre automáticamente
    end, {1}),
    f(function(args)
      local name = args[1][1] or "Plugin"
      local footer_base = "-- }} " .. name .. " ends here "
      local remaining = 100 - #footer_base
      if remaining < 0 then remaining = 0 end
      return " ends here " .. string.rep("-", remaining)
    end, {1}),
    i(0),  -- cursor final
  }),
}
