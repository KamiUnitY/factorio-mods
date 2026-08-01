local util = require("libraries/utility")

if mods["crushing-industry"] then
    if settings.startup["crushing-industry-coal"].value then
        util.recipe_replace_ingredient("grenade", "coal", "crushed-coal")
        util.table.patch(data.raw.item["crushed-coal"], {
            fuel_value = "2.0MJ",
            stack_size = 200,
            weight = 1 * kg
        })
    end
    if settings.startup["crushing-industry-space-crusher"].value and not settings.startup["crushing-industry-space-crusher-quality"].value then
        data.raw["assembling-machine"]["crusher"].effect_receiver = {base_effect={productivity=0.5}}
    end
end

if mods["aai-vehicles-ironclad"] then
    data.raw.ammo["mortar-bomb"].stack_size = 100
    data.raw.ammo["mortar-cluster-bomb"].stack_size = 100
end

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
