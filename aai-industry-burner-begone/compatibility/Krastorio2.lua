local util = require("libraries/utility")
local aai_util = require("__aai-industry__/data-util")

if mods["Krastorio2"] then
    data.raw.recipe["kr-blank-tech-card"].category = "crafting"

    util.recipe_clear_ingredients("lab", {
        {type = "item", name = "copper-plate"},
        {type = "item", name = "copper-cable"},
    })
    util.recipe_set_ingredient_amount("lab", {
        {type = "item", name = "electronic-circuit", amount = 10}
    })

    data.raw.technology["kr-automation-core"].prerequisites = {}
    data.raw.technology["basic-fluid-handling"].prerequisites = {"kr-automation-core"}
    
    table.insert(data.raw.technology["automation"].unit.ingredients, {"kr-basic-tech-card", 1})
    data.raw.technology["basic-fluid-handling"].unit.ingredients = {{"kr-basic-tech-card", 1}}
    data.raw.technology["steam-power"].unit.ingredients = {{"kr-basic-tech-card", 1}}

end
