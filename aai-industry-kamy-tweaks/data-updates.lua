local util = require("libraries/utility")
local aai_util = require("__aai-industry__/data-util")

util.technology_remove_recipe_effect_from_all("iron-gear-wheel")
util.technology_insert_recipe_last("burner-mechanics", "iron-gear-wheel")
util.technology_remove_recipe_effect_from_all("iron-stick")
util.technology_insert_recipe_last("burner-mechanics", "iron-stick")

data.raw["assembling-machine"]["burner-assembling-machine"].crafting_categories = data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories

util.technology_remove("basic-logistics")
util.technology_insert_recipe_after("burner-mechanics", "transport-belt", "motor")

data.raw.technology["electricity"].prerequisites = {"automation-science-pack"}

util.table.patch(data.raw.technology["basic-fluid-handling"].unit, {
    count = 25,
    time = 10
})

util.table.patch(data.raw.technology["automation"].unit, {
    count = 50,
    time = 15
})

util.table.patch(data.raw.technology["electric-lab"].unit, {
    count = 50,
    time = 15
})

util.table.patch(data.raw.technology["glass-processing"].unit, {
    count = 20,
    time = 10
})

if settings.startup["aai-kamy-early-steam-power"].value then
    data.raw.technology["steam-power"].prerequisites = {"basic-fluid-handling"}
    util.table.patch(data.raw.technology["steam-power"].unit, {
        count = 75,
        time = 15,
        ingredients ={
            {"automation-science-pack", 1},
        },
    })
end

data.raw.technology["automation"].order = "b"
data.raw.technology["electric-lab"].order = "b"

data.raw.technology["logistic-science-pack"].order = "b"
