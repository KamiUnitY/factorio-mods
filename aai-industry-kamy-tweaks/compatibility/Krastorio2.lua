local util = require("libraries/utility")
local aai_util = require("__aai-industry__/data-util")

if mods["Krastorio2"] then
    util.recipe_clear_ingredients("lab", {
        {type = "item", name = "copper-plate"},
        {type = "item", name = "copper-cable"},
    })
    util.recipe_set_ingredient_amount("lab", {
        {type = "item", name = "electronic-circuit", amount = 10}
    })

    data.raw.technology["steam-power"].unit.ingredients = {
        {"kr-basic-tech-card", 1},
        {"automation-science-pack", 1},
    }
end
