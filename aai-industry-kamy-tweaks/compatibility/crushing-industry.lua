local util = require("libraries/utility")
local aai_util = require("__aai-industry__/data-util")

if mods["crushing-industry"] then
    if settings.startup["aai-kamy-no-burner-upgrades"].value then
        util.recipe_clear_ingredients("electric-crusher", {
            {type = "item", name = "burner-crusher"},
        })
        util.recipe_set_ingredient_amount("electric-crusher", {
            {type = "item", name = "stone-brick", amount = 5},
        })
    end

    util.technology_remove_recipe_effect_from_all("burner-crusher")
    util.technology_insert_recipe_last("sand-processing", "burner-crusher")

    util.technology_remove_recipe_effect_from_all("electric-crusher")
    if settings.startup["crushing-industry-ore"].value then
        data.raw.technology["ore-crushing"].prerequisites = {"advanced-material-processing"}
        util.technology_insert_recipe_last("ore-crushing", "electric-crusher")
    else
        util.technology_insert_recipe_last("advanced-material-processing", "electric-crusher")
    end
end
