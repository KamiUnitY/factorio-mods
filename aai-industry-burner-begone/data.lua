local util = require("libraries/utility")

if settings.startup["aai-bb-cheaper-electric-motor"].value then
    data.raw.recipe["electric-motor"].ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 1},
        {type = "item", name = "copper-cable", amount = 4},
    }
end

data.raw.recipe["inserter"].ingredients = {
    {type="item", name="iron-stick", amount=2},
    {type="item", name="electric-motor", amount=1},
}

data.raw.recipe["lab"].ingredients = {
    {type="item", name="electronic-circuit", amount=10},
    {type="item", name="electric-motor", amount=5},
    {type="item", name="motor", amount=5},
    {type="item", name="stone-brick", amount=5},
}

data.raw.recipe["assembling-machine-1"].ingredients = {
    {type = "item", name = "iron-gear-wheel", amount = 9},
    {type = "item", name = "electric-motor", amount = 3},
    {type = "item", name = "stone-brick", amount = 4},
}

util.recipe_set_ingredient_amount("assembling-machine-2", {
    {type = "item", name = "electric-motor", amount = 3},
    {type = "item", name = "electronic-circuit", amount = 5},
})

data.raw.recipe["electric-mining-drill"].ingredients = {
    {type = "item", name = "iron-gear-wheel", amount = 6},
    {type = "item", name = "electric-motor", amount = 6},
    {type = "item", name = "stone-brick", amount = 4},
}

local electric_furnace_ingredients = {
    {type = "item", name = "steel-plate", amount = 10},
    {type = "item", name = "advanced-circuit", amount = 5},
    {type = "item", name = "stone-brick", amount = 10},
}
if mods["space-exploration"] then
    table.insert(electric_furnace_ingredients, {type = "item", name = "se-heat-shielding", amount = 1})
end
data.raw.recipe["electric-furnace"].ingredients = electric_furnace_ingredients
