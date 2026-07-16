local util = require("libraries/utility")

if mods["crushing-industry"] then
    util.technology_remove_recipe_effect("concrete", "crushed-iron-ore")
    if settings.startup["crushing-industry-concrete-mix"].value and settings.startup["crushing-industry-ore"].value then
        util.technology_insert_recipe_last("concrete", "crushed-iron-ore")
    end

    util.technology_remove_recipe_effect_from_all("big-crusher")
    util.technology_insert_recipe_last("tungsten-steel", "big-crusher")
end

if mods["aai-industry"] and mods["crushing-industry"] then
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
