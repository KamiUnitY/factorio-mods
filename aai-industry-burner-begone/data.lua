local util = require("libraries/utility")

data.raw.recipe["assembling-machine-1"].ingredients = {
    {type = "item", name = "iron-gear-wheel", amount = 8},
    {type = "item", name = "electric-motor", amount = 2},
    {type = "item", name = "stone-brick", amount = 4},
}

data.raw.recipe["lab"].ingredients = {
    {type="item", name="electronic-circuit", amount=10},
    {type="item", name="electric-motor", amount=5},
    {type="item", name="motor", amount=5},
    {type="item", name="stone-brick", amount=5},
}

if settings.startup["aai-bb-cheaper-electric-motor"].value then
    data.raw.recipe["electric-motor"].ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 1},
        {type = "item", name = "copper-cable", amount = 4},
    }
end