local util = require("libraries/utility")

if mods["FluidMustFlowThruTungsten"] then
    util.recipe_clear_ingredients("duct-small", {
        {type = "item", name = "tungsten-plate"},
    })
    util.recipe_set_ingredient_amount("duct-small", {
        {type = "item", name = "tungsten-carbide", amount = 2}
    })

    util.recipe_clear_ingredients("duct-underground", {
        {type = "item", name = "tungsten-plate"},
    })
    util.recipe_set_ingredient_amount("duct-underground", {
        {type = "item", name = "tungsten-carbide", amount = 10},
        {type = "item", name = "duct-small", amount = 30}
    })

    util.recipe_clear_ingredients("duct-t-junction", {
        {type = "item", name = "tungsten-plate"},
    })
    util.recipe_set_ingredient_amount("duct-t-junction", {
        {type = "item", name = "tungsten-carbide", amount = 4}
    })

    util.recipe_clear_ingredients("duct-curve", {
        {type = "item", name = "tungsten-plate"},
    })
    util.recipe_set_ingredient_amount("duct-curve", {
        {type = "item", name = "tungsten-carbide", amount = 4}
    })

    util.recipe_clear_ingredients("duct-cross", {
        {type = "item", name = "tungsten-plate"},
    })
    util.recipe_set_ingredient_amount("duct-cross", {
        {type = "item", name = "tungsten-carbide", amount = 4}
    })
end
