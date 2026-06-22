local util = require("libraries/utility")
local aai_util = require("__aai-industry__/data-util")

aai_util.enable_recipe("iron-gear-wheel")
aai_util.enable_recipe("iron-stick")
aai_util.enable_recipe("copper-cable")

util.recipe_remove("burner-lab")
util.recipe_remove("burner-assembling-machine")

data:extend({{type = "recipe-category", name = "none"}})
data.raw["assembling-machine"]["burner-assembling-machine"].crafting_categories = {"none"}

util.technology_remove("basic-logistics")

util.technology_remove("electric-lab")
aai_util.tech_lock_recipes("electronics", {
    "lab",
})

data.raw.technology["burner-mechanics"].prerequisites = {}
data.raw.technology["burner-mechanics"].research_trigger = {
    type = "craft-item",
    item = "iron-plate",
    count = 10,
}
data.raw.technology["burner-mechanics"].unit = nil

data.raw.technology["electricity"].prerequisites = {}
data.raw.technology["electricity"].research_trigger = {
    type = "craft-item",
    item = "copper-plate",
    count = 10,
}
data.raw.technology["electricity"].unit = nil

data.raw.technology["electronics"].prerequisites = {"burner-mechanics", "electricity"}
data.raw.technology["electronics"].research_trigger = {
    type = "craft-item",
    item = "burner-turbine",
    count = 1,
}
data.raw.technology["electronics"].unit = nil

data.raw.technology["automation-science-pack"].prerequisites = {"electronics"}
data.raw.technology["automation-science-pack"].research_trigger = {
    type = "craft-item",
    item = "lab",
    count = 1,
}
data.raw.technology["automation-science-pack"].unit = nil

data.raw.technology["automation"].prerequisites = {"automation-science-pack"}
util.table.patch(data.raw.technology["automation"].unit, {
    count = 10,
    time = 10,
})

data.raw.technology["logistic-science-pack"].prerequisites = {"automation-science-pack"}
data.raw.technology["basic-fluid-handling"].prerequisites = {"automation-science-pack"}

data.raw.technology["electronics"].order = "a"
data.raw.technology["automation-science-pack"].order = "b"
