local util = require("libraries/utility")

if settings.startup["aai-kamy-no-burner-upgrades"].value then
    data.raw.recipe["inserter"].ingredients = {
        {type="item", name="iron-stick", amount=2},
        {type="item", name="electric-motor", amount=1},
    }

    data.raw.recipe["lab"].ingredients = {
        {type="item", name="glass", amount=15},
        {type="item", name="electronic-circuit", amount=10},
        {type="item", name="electric-motor", amount=10},
        {type="item", name="stone-brick", amount=5},
    }

    data.raw.recipe["assembling-machine-1"].ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 8},
        {type = "item", name = "electric-motor", amount = 2},
        {type = "item", name = "stone-brick", amount = 4},
    }

    data.raw.recipe["electric-mining-drill"].ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 5},
        {type = "item", name = "electric-motor", amount = 5},
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

    if mods["crushing-industry"] then
        util.recipe_clear_ingredients("electric-crusher", {
            {type = "item", name = "burner-crusher"},
        })
        util.recipe_set_ingredient_amount("electric-crusher", {
            {type = "item", name = "stone-brick", amount = 5},
        })
    end
end

if mods["FluidMustFlow"] then
    util.recipe_replace_ingredient("duct-intake", "engine-unit", "electric-engine-unit")
    util.recipe_replace_ingredient("duct-exhaust", "engine-unit", "electric-engine-unit")
end