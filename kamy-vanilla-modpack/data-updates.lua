local util = require("libraries/utility")

if mods["aai-industry"] then
    data:extend({
        {
            type = "item-subgroup",
            name = "lab",
            group = "production",
            order = "e-m"
        }
    })

    data.raw.item["burner-lab"].subgroup = "lab"
    data.raw.item["lab"].subgroup = "lab"
    data.raw.item["biolab"].subgroup = "lab"
end

if mods["crushing-industry"] then
    data.raw.recipe["sand"].categories = {"basic-crushing"}

    util.technology_remove_recipe_effect("concrete", "crushed-iron-ore")
    if settings.startup["crushing-industry-concrete-mix"].value and settings.startup["crushing-industry-ore"].value then
        util.technology_insert_recipe_last("concrete", "crushed-iron-ore")
    end

    util.technology_remove_recipe_effect_from_all("big-crusher")
    util.technology_insert_recipe_last("tungsten-steel", "big-crusher")
end

if mods["enriching-industry"] then
    data:extend({
        {
            type = "item-subgroup",
            name = "raw-resource-enriching",
            group = "intermediate-products",
            order = "b-m"
        }
    })

    data.raw.recipe["ei-quartz"].subgroup = "raw-resource-enriching"
    data.raw.recipe["ei-enriched-iron-ore"].subgroup = "raw-resource-enriching"
    data.raw.recipe["ei-sulfuric-iron-leaching"].subgroup = "raw-resource-enriching"
    data.raw.recipe["ei-enriched-iron-ore-recrystallization"].subgroup = "raw-resource-enriching"
    data.raw.recipe["ei-enriched-copper-ore"].subgroup = "raw-resource-enriching"
    data.raw.recipe["ei-sulfuric-copper-leaching"].subgroup = "raw-resource-enriching"
    data.raw.recipe["ei-enriched-copper-ore-recrystallization"].subgroup = "raw-resource-enriching"
    data.raw.recipe["ei-tailing-slurry-filtering"].subgroup = "raw-resource-enriching"
    data.raw.recipe["ei-tailing-slurry-reprocessing"].subgroup = "raw-resource-enriching"

    data.raw.recipe["ei-quartz-smelting"].order = "a[smelting]-d[glass]-a[quartz]"
    data.raw.recipe["ei-tailing-slurry-reprocessing"].order = "f[tailing-slurry-reprocessing]"
    data.raw.recipe["ei-tailing-slurry-filtering"].order = "f[tailing-slurry-filtering]"
end
