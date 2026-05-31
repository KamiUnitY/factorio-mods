local util = require("libraries/utility")
local aai_util = require("__aai-industry__/data-util")

if mods["Krastorio2-spaced-out"] then
    util.recipe_clear_ingredients("lab", {
        {type = "item", name = "copper-plate"},
        {type = "item", name = "copper-cable"},
    })
    util.recipe_set_ingredient_amount("lab", {
        {type = "item", name = "electronic-circuit", amount = 10}
    })
end
