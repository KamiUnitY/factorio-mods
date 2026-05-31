local util = require("libraries/utility")
local aai_util = require("__aai-industry__/data-util")

aai_util.enable_recipe("iron-stick")

data.raw.item["burner-assembling-machine"].icon = "__aai-industry-kamy-tweaks__/graphics/icons/burner-assembling-machine.png"
data.raw["assembling-machine"]["burner-assembling-machine"].icon = "__aai-industry-kamy-tweaks__/graphics/icons/burner-assembling-machine.png"
data.raw["assembling-machine"]["burner-assembling-machine"].crafting_categories = data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories

data.raw.technology["basic-fluid-handling"].icon = "__aai-industry-kamy-tweaks__/graphics/technology/basic-fluid-handling.png"

util.technology_remove("basic-logistics")
aai_util.tech_lock_recipes("burner-mechanics", {
    "transport-belt",
})

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

data.raw.technology["steam-power"].prerequisites = {"basic-fluid-handling"}
util.table.patch(data.raw.technology["steam-power"].unit, {
    count = 75,
    time = 15
})
util.technology_remove_ingredients("steam-power", {
    "logistic-science-pack",
})

data.raw.technology["automation"].order = "b"
data.raw.technology["electric-lab"].order = "b"

data.raw.technology["logistic-science-pack"].order = "b"

-- Intended to use for reordering only.
aai_util.tech_lock_recipes("burner-mechanics", {
    "burner-inserter",
    "burner-mining-drill",
    "burner-assembling-machine",
    "burner-lab",
})