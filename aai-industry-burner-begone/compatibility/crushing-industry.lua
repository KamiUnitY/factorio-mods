local util = require("libraries/utility")
local aai_util = require("__aai-industry__/data-util")

if mods["crushing-industry"] then
    util.recipe_clear_ingredients("electric-crusher", {
        {type = "item", name = "burner-crusher"},
    })
    util.recipe_set_ingredient_amount("electric-crusher", {
        {type = "item", name = "stone-brick", amount = 5},
    })
end
